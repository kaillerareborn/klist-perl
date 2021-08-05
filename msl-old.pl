# Start
#!/kaillera/cgi-bin/perl

use LWP::Simple;

$url = "http://kaillera.com/raw_server_list.php";

$server_file = "servers.dat";

# get and store the document
getstore $url, $server_file;

$file       = "kaillera.dat";
$file2      = "kailler2.dat";
$local_file = "servers.dat";
open( FILE, "$local_file" );
($status) = <FILE>;
close FILE;
open( INFO,  ">$file" );
open( INFO2, ">$file2" );

open( FILEE, "<$local_file" );
while (<FILEE>) {
    $i++;
    $line = $_;
    chomp($line);
    if ( $i % 2 ) {
        print INFO "$linen";
    }
    else {
        print INFO2 "$linen";
    }
}
close INFO;
close INFO2;

# Output the header so this CGI works
print "Content-type: text/htmlnn";
open( FILE,  "$file" );
open( FILE2, "$file2" );
print
  "<table border=1>n <tr>n<th>NAME</th>n<th>USERS</th>n<th>LOCATION</th>n<tr>n";
while (<FILE2>) {
    ($line2) = $_;
    chomp($line2);
    $line = <FILE>;
    chomp($line);
    ( $line2 =~ m!(d+).(d+).(d+).(d+).(d+).(d+).(d+).(d+).(w+)! );
    print
" <tr>n<td><a href=http://$1.$2.$3.$4:$5?page=status>$line</a></td>n<td>$6/$7</td>n<td>$9</td>n</tr>n";
}
print "</table>"

# End