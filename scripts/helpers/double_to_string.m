function s = double_to_string(a)
%DOUBLE_TO_STRING Converts a double number into a string omitting the dot

    a = sprintf('%5.10f',a);
    str = textscan(num2str(a),'%s %s','delimiter','.');
    temp=str{1}; s1=temp{1};
    if isempty(str{2})
      s = s1;
    else
      temp=str{2}; s2=temp{1};
      s = strcat(s1,s2);
    end
  
end