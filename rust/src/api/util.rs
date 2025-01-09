use flutter_rust_bridge::frb;
pub use matrix_sdk::reqwest::Url as RustUrl;

#[frb(sync)]
pub fn parse_rust_url(url: &str) -> Option<RustUrl> {
    RustUrl::parse(url).ok()
}

#[frb(sync)]
pub fn is_rust_url_https(url: &RustUrl) -> bool {
    url.scheme() == "https"
}
