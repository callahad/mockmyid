publish:
	rsync -a --delete-after public_html/ mockmyid.com:/srv/www/com.mockmyid
