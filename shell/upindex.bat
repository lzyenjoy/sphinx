D:\wamp64\www\sp\bin\indexer.exe -c D:\wamp64\www\sp\bin\sphinx.conf article_delta_index --rotate
@ping 127.0.0.1 -n 6　>nul
D:\wamp64\www\sp\bin\indexer.exe -c D:\wamp64\www\sp\bin\sphinx.conf --merge article_index article_delta_index --rotate
