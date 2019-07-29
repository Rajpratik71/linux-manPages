for i in `ls /sbin`; do man /sbin/$i | > "$i".md; done
