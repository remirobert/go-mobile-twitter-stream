package twitter

import "github.com/dghubble/oauth1"

const (
	streamingEndpoint   = "https://stream.twitter.com/1.1/statuses/filter.json"
	streamingTrackPoint = "?track="
)

type Config struct {
	config *oauth1.Config
	token  *oauth1.Token
}

func NewConfig(consumer string, consumerSecret string, token string, tokenSecret string) *Config {
	return &Config{
		oauth1.NewConfig(
			consumer,
			consumerSecret,
		),
		oauth1.NewToken(
			token,
			tokenSecret,
		),
	}
}
