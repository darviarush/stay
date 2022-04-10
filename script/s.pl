# находит { и } которые не сдвинуты на нужное количество табов от начала строки

$\ = "\n";
sub echo($) { print @_; exit; }

$u = 0;
while(<>) {
	$i = 0; $j = 0;
	$i++, $u++ while /\{/g;
	$j++, $u-- while /\}/g;
	
	$tmp = $i; $i-=$j; $j-=$tmp;
	
	echo "$.. $j незакрытых }" if $j > 1;
	echo "$.. $i незакрытых {" if $i > 1;
	
	$len = /^\s+/? length $&: 0;
	
	echo "$.. Уровень } не совпадает: $len!=$u" if $j>0 and $len!=$u;
	echo "$.. Уровень { не совпадает: $len!=".($u-1) if $i>0 and $len!=$u-1;
}