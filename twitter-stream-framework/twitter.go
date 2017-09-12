package twitter

import (
	"context"
	"net/http"
	"encoding/json"
)

type Twitter struct {
	client   *http.Client
	config   Config
	ctx      context.Context
	callback TwitterCallback
}

type TwitterCallback interface {
	GetContent(response *Tweet)
}

func NewTitter(callback TwitterCallback, config *Config) *Twitter {
	ts := Twitter{}
	ts.config = *config
	ts.callback = callback
	ts.initClient()
	return &ts
}

func (ts *Twitter) initClient() {
	ts.ctx = context.Background()
	ts.client = ts.config.config.Client(ts.ctx, ts.config.token)
}

func (ts *Twitter) streamFilter(queryString string) (*http.Response, error) {
	req, err := http.NewRequest("POST", streamingEndpoint+queryString, nil)
	if err != nil {
		return nil, err
	}
	return ts.client.Do(req)
}

func (ts *Twitter) read(track string) {
	resp, err := ts.streamFilter(streamingTrackPoint + track)
	if err != nil {
		return
	}
	for {
		response := Response{}
		json.NewDecoder(resp.Body).Decode(&response)
		tweet := NewTweet(response)
		ts.callback.GetContent(&tweet)
	}
}

func (ts *Twitter) StartRead(track string) {
	go ts.read(track)
}

func (ts *Twitter) Close() {
	ts.ctx.Done()
}
