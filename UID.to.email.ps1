$mailboxList = Import-Csv H:\listget.csv | % {$_.userID}
ForEach($item in  $mailboxList) 
{
    $Mailbox = Get-exoMailbox -Identity $item -ErrorAction Silentlycontinue -ResultSize unlimited
    If ($Mailbox) {
    $temp = get-exomailbox -Identity $item | Select -ExpandProperty PrimarySmtpaddress 
    $temp >> "H:/newlist.csv"
   }
    Else {
    $temp = get-mailbox -Identity $item | Select -expandproperty PrimarySmtpaddress 
    $temp >> "H:/newlist.csv"
    }
    }
