dunstify -r 1234 "Sending POST Request..."

if w3m -dump -post - https://fw.bits-pilani.ac.in:8090/login.xml<<<'mode=191&username=f20180193&password=A7PS01932609%23&a=$(date +%s)&producttype=0' | grep -q "signed in"
then
    dunstify -r 1234 "Signed in!";
else
    dunstify -r 1234 "Failed due to time out";
fi


