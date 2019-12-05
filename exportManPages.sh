for i in `ls /sbin`; do man $i > "$i".md; done

for i in `ls /bin`; do man $i > "$i".md; done

for i in `ls /usr/bin`; do man $i > "$i".md; done

for i in `ls /usr/sbin`; do man $i > "$i".md; done

for i in `ls /usr/local/sbin`; do man $i > "$i".md; done

for i in `ls /usr/local/bin`; do man $i > "$i".md; done

for i in `ls /snap/bin`; do man $i > "$i".md; done
