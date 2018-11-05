if(string_letters(argument0)=string_letters(message[0]) && string_digits(message[0]) !="" && ord(string_char_at(argument0, string_length(argument0)))>=60 && ord(string_char_at(argument0, string_length(argument0)))<=71)
{
    message[0]=string_replace(argument[0],string_digits(argument0),string(real(string_digits(argument0))+real(string_digits(message[0]))))
}
else
{
    for(i=0;i<=14;i+=1)
    {
        message[15-i]=message[14-i];
    }
    message[0]=argument0;
}
