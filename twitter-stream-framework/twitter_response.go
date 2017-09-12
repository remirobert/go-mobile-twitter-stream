package twitter

type Tweet struct {
	Text              string
	UserName          string
	UserDisplayedName string
	UserImageUrl      string
}

func NewTweet(response Response) Tweet {
	return Tweet{
		response.Text,
		response.User.Name,
		response.User.ScreenName,
		response.User.ProfileImageURL,
	}
}

type Response struct {
	CreatedAt            string      `json:"created_at"`
	ID                   int64       `json:"id"`
	IDStr                string      `json:"id_str"`
	Text                 string      `json:"text"`
	Source               string      `json:"source"`
	Truncated            bool        `json:"truncated"`
	InReplyToStatusID    interface{} `json:"in_reply_to_status_id"`
	InReplyToStatusIDStr interface{} `json:"in_reply_to_status_id_str"`
	InReplyToUserID      interface{} `json:"in_reply_to_user_id"`
	InReplyToUserIDStr   interface{} `json:"in_reply_to_user_id_str"`
	InReplyToScreenName  interface{} `json:"in_reply_to_screen_name"`
	User struct {
		ID                             int64       `json:"id"`
		IDStr                          string      `json:"id_str"`
		Name                           string      `json:"name"`
		ScreenName                     string      `json:"screen_name"`
		Location                       interface{} `json:"location"`
		URL                            interface{} `json:"url"`
		Description                    string      `json:"description"`
		Protected                      bool        `json:"protected"`
		Verified                       bool        `json:"verified"`
		FollowersCount                 int         `json:"followers_count"`
		FriendsCount                   int         `json:"friends_count"`
		ListedCount                    int         `json:"listed_count"`
		FavouritesCount                int         `json:"favourites_count"`
		StatusesCount                  int         `json:"statuses_count"`
		CreatedAt                      string      `json:"created_at"`
		UtcOffset                      int         `json:"utc_offset"`
		TimeZone                       string      `json:"time_zone"`
		GeoEnabled                     bool        `json:"geo_enabled"`
		Lang                           string      `json:"lang"`
		ContributorsEnabled            bool        `json:"contributors_enabled"`
		IsTranslator                   bool        `json:"is_translator"`
		ProfileBackgroundColor         string      `json:"profile_background_color"`
		ProfileBackgroundImageURL      string      `json:"profile_background_image_url"`
		ProfileBackgroundImageURLHTTPS string      `json:"profile_background_image_url_https"`
		ProfileBackgroundTile          bool        `json:"profile_background_tile"`
		ProfileLinkColor               string      `json:"profile_link_color"`
		ProfileSidebarBorderColor      string      `json:"profile_sidebar_border_color"`
		ProfileSidebarFillColor        string      `json:"profile_sidebar_fill_color"`
		ProfileTextColor               string      `json:"profile_text_color"`
		ProfileUseBackgroundImage      bool        `json:"profile_use_background_image"`
		ProfileImageURL                string      `json:"profile_image_url"`
		ProfileImageURLHTTPS           string      `json:"profile_image_url_https"`
		ProfileBannerURL               string      `json:"profile_banner_url"`
		DefaultProfile                 bool        `json:"default_profile"`
		DefaultProfileImage            bool        `json:"default_profile_image"`
		Following                      interface{} `json:"following"`
		FollowRequestSent              interface{} `json:"follow_request_sent"`
		Notifications                  interface{} `json:"notifications"`
	} `json:"user"`
	Geo          interface{} `json:"geo"`
	Coordinates  interface{} `json:"coordinates"`
	Place        interface{} `json:"place"`
	Contributors interface{} `json:"contributors"`
	RetweetedStatus struct {
		CreatedAt            string      `json:"created_at"`
		ID                   int64       `json:"id"`
		IDStr                string      `json:"id_str"`
		Text                 string      `json:"text"`
		Source               string      `json:"source"`
		Truncated            bool        `json:"truncated"`
		InReplyToStatusID    interface{} `json:"in_reply_to_status_id"`
		InReplyToStatusIDStr interface{} `json:"in_reply_to_status_id_str"`
		InReplyToUserID      interface{} `json:"in_reply_to_user_id"`
		InReplyToUserIDStr   interface{} `json:"in_reply_to_user_id_str"`
		InReplyToScreenName  interface{} `json:"in_reply_to_screen_name"`
		User struct {
			ID                             int         `json:"id"`
			IDStr                          string      `json:"id_str"`
			Name                           string      `json:"name"`
			ScreenName                     string      `json:"screen_name"`
			Location                       string      `json:"location"`
			URL                            string      `json:"url"`
			Description                    string      `json:"description"`
			Protected                      bool        `json:"protected"`
			Verified                       bool        `json:"verified"`
			FollowersCount                 int         `json:"followers_count"`
			FriendsCount                   int         `json:"friends_count"`
			ListedCount                    int         `json:"listed_count"`
			FavouritesCount                int         `json:"favourites_count"`
			StatusesCount                  int         `json:"statuses_count"`
			CreatedAt                      string      `json:"created_at"`
			UtcOffset                      int         `json:"utc_offset"`
			TimeZone                       string      `json:"time_zone"`
			GeoEnabled                     bool        `json:"geo_enabled"`
			Lang                           string      `json:"lang"`
			ContributorsEnabled            bool        `json:"contributors_enabled"`
			IsTranslator                   bool        `json:"is_translator"`
			ProfileBackgroundColor         string      `json:"profile_background_color"`
			ProfileBackgroundImageURL      string      `json:"profile_background_image_url"`
			ProfileBackgroundImageURLHTTPS string      `json:"profile_background_image_url_https"`
			ProfileBackgroundTile          bool        `json:"profile_background_tile"`
			ProfileLinkColor               string      `json:"profile_link_color"`
			ProfileSidebarBorderColor      string      `json:"profile_sidebar_border_color"`
			ProfileSidebarFillColor        string      `json:"profile_sidebar_fill_color"`
			ProfileTextColor               string      `json:"profile_text_color"`
			ProfileUseBackgroundImage      bool        `json:"profile_use_background_image"`
			ProfileImageURL                string      `json:"profile_image_url"`
			ProfileImageURLHTTPS           string      `json:"profile_image_url_https"`
			ProfileBannerURL               string      `json:"profile_banner_url"`
			DefaultProfile                 bool        `json:"default_profile"`
			DefaultProfileImage            bool        `json:"default_profile_image"`
			Following                      interface{} `json:"following"`
			FollowRequestSent              interface{} `json:"follow_request_sent"`
			Notifications                  interface{} `json:"notifications"`
		} `json:"user"`
		Geo           interface{} `json:"geo"`
		Coordinates   interface{} `json:"coordinates"`
		Place         interface{} `json:"place"`
		Contributors  interface{} `json:"contributors"`
		IsQuoteStatus bool        `json:"is_quote_status"`
		RetweetCount  int         `json:"retweet_count"`
		FavoriteCount int         `json:"favorite_count"`
		Entities struct {
			Hashtags []struct {
				Text    string `json:"text"`
				Indices []int  `json:"indices"`
			} `json:"hashtags"`
			Urls []struct {
				URL         string `json:"url"`
				ExpandedURL string `json:"expanded_url"`
				DisplayURL  string `json:"display_url"`
				Indices     []int  `json:"indices"`
			} `json:"urls"`
			UserMentions []interface{} `json:"user_mentions"`
			Symbols      []interface{} `json:"symbols"`
		} `json:"entities"`
		Favorited         bool   `json:"favorited"`
		Retweeted         bool   `json:"retweeted"`
		PossiblySensitive bool   `json:"possibly_sensitive"`
		FilterLevel       string `json:"filter_level"`
		Lang              string `json:"lang"`
	} `json:"retweeted_status"`
	IsQuoteStatus bool `json:"is_quote_status"`
	RetweetCount  int  `json:"retweet_count"`
	FavoriteCount int  `json:"favorite_count"`
	Entities struct {
		Hashtags []interface{} `json:"hashtags"`
		Urls []struct {
			URL         string `json:"url"`
			ExpandedURL string `json:"expanded_url"`
			DisplayURL  string `json:"display_url"`
			Indices     []int  `json:"indices"`
		} `json:"urls"`
		UserMentions []struct {
			ScreenName string `json:"screen_name"`
			Name       string `json:"name"`
			ID         int    `json:"id"`
			IDStr      string `json:"id_str"`
			Indices    []int  `json:"indices"`
		} `json:"user_mentions"`
		Symbols []interface{} `json:"symbols"`
	} `json:"entities"`
	Favorited         bool   `json:"favorited"`
	Retweeted         bool   `json:"retweeted"`
	PossiblySensitive bool   `json:"possibly_sensitive"`
	FilterLevel       string `json:"filter_level"`
	Lang              string `json:"lang"`
	TimestampMs       string `json:"timestamp_ms"`
}
