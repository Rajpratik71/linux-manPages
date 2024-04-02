for i in `ls /sbin`; do man $i > docs/"$i".md; done

for i in `ls /bin`; do man $i > docs/"$i".md; done

for i in `ls /usr/bin`; do man $i > docs/"$i".md; done

for i in `ls /usr/sbin`; do man $i > docs/"$i".md; done

for i in `ls /usr/local/sbin`; do man $i > docs/"$i".md; done

for i in `ls /usr/local/bin`; do man $i > docs/"$i".md; done

find . -type f -size 0 | while read file; do rm "$file"; done

git status --porcelain | grep '^??' | cut -c4- | xargs git add

git reset --hard