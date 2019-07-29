for i in `ls /sbin`; do man /sbin/$i | > "$i".md; done


for i in `ls /bin`; do man /bin/$i | > "$i".md; done


for i in `ls /usr/bin`; do man /usr/bin/$i | > "$i".md; done


for i in `ls /usr/sbin`; do man /usr/sbin/$i | > "$i".md; done


for i in `ls /usr/local/sbin`; do man /usr/local/sbin/$i | > "$i".md; done


for i in `ls /usr/local/bin`; do man /usr/local/bin/$i | > "$i".md; done
