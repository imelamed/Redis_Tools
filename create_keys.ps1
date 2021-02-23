# Create Redis Records #
#
# Create Keys from Windows Client with TTL and Progress bar


$NumOfKeys = 1000
$NOW = Get-Date -UFormat "%Y%m%d-%H%M%S"
for($i=1; $i -le $NumOfKeys; $i++)
{
$STRING = "IM:TST:"+$NOW+":"+$i
redis-cli set $STRING Test$i >$Null
redis-cli expire $STRING $i >$Null
$Percent = "{0:N0}" -f (($i / $NumOfKeys) * 100) 
Write-Progress -Activity "Adding Redis Keys" -Status "RedisKeys: $i Complete: $Percent%" -PercentComplete $Percent
}
