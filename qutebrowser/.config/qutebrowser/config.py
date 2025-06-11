config.load_autoconfig()
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')
config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0', 'https://accounts.google.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')
c.url.default_page = 'https://search.brave.com/'
c.url.start_pages = 'https://search.brave.com/'
c.url.incdec_segments = ['path', 'query']
c.url.searchengines = {'DEFAULT': 'https://search.brave.com/search?q={}&source=web',
                       'yt': 'https://www.youtube.com/results?search_query={}',
                       'gt': 'https://github.com/search?q={}&type=repositories',
                       'pdb': 'https://www.protondb.com/search?q={}'}
config.bind(",Y", 'hint links spawn mpv {hint-url}')
c.content.blocking.enabled = True
c.content.blocking.method = 'adblock' # uncomment this if you install python-adblock
c.content.blocking.adblock.lists = [
"https://github.com/ewpratten/youtube_ad_blocklist/blob/master/blocklist.txt",
"https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt",
"https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",
"https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt",
"https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt",
"https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2022.txt",
"https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2023.txt",
"https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2024.txt",
"https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt",
"https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
"https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
"https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt",
"https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-cookies.txt",
"https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-others.txt",
"https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
"https://github.com/uBlockOrigin/uAssets/raw/master/filters/quick-fixes.txt",
"https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt",
"https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt"]

