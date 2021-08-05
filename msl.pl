use LWP::Simple;

$url = "http://kaillera.com/raw_server_list.php";

$server_file = "servers.dat";

# get and store the document
getstore $url, $server_file;

# Output the header so this CGI works
print "Content-type: text/htmlnn";
print
  "<table border>n<tr>n <th>NAME</th>n <th>USERS</th>n <th>LOCATION</th>n<tr>n";
$local_file = "servers.dat";
open( FILE, "$local_file" );
($status) = <FILE>;
close FILE;

open( FILEE, "<$local_file" );
while (<FILEE>) {
    $i++;
    $linee = $_;
    chomp($linee);
    if ( $i % 2 ) {
        $line = "$linee";
    }
    else {
        $line2 = "$linee";
        chomp($line2);
        chomp($line);

        # ---/ 127. 0 . 0 . 1 :27888; 15 / 30 ; ? ; loc
        ( $line2 =~ m!(d+).(d+).(d+).(d+):(d+);(d+)/(d+);(d+);(.*$)! );
        print
"<tr>n <td><a href=http://$1.$2.$3.$4:$5?page=status>$line</a></td>n <td>$6/$7</td>n <td>$9</td>n</tr>n";
    }
}
print "</table>"