// real lispTokenise(string input)
// Tokenises a Faucet Lisp s-expression and returns result as a ds_list

var input;
input = argument0;

var tokens, pos, len, state, char, isWhitespace, currentToken;
tokens = ds_list_create();
pos = 1;
len = string_length(input);
state = 'outside_token';
currentToken = '';

for (pos = 1; pos <= len; pos += 1)
{
    char = string_char_at(input, pos);
    // space, LF, CR and tab
    isWhitespace = (char == ' ' or char == chr(10) or char == chr(13) or char == chr(9));
    switch (state)
    {
        case 'outside_token':
            if (isWhitespace)
                continue;
            if (char == "'" or char == '(' or char == ')')
                ds_list_add(tokens, char);
            else
            {
                currentToken = char;
                state = 'inside_token';
            }
        break;
        case 'inside_token':
            if (isWhitespace or char == ')')
            {
                ds_list_add(tokens, currentToken);
                if (char == ')')
                    ds_list_add(tokens, char);
                state = 'outside_token';
            }
            else
                currentToken += char;
        break;
    }
}

if (state == 'inside_token')
    show_error('Error in Faucet Lisp code: unexpected end of input while parsing', true);

return tokens;
