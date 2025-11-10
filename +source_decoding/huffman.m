function [output] = huffman(huffman_structure,input_seq)
    root = huffman_structure.huffman_structure; 
    node  = root;
    decode_c  = {};
    type = huffman_structure.type;
    for i = 1:length(input_seq)
        if input_seq(i) == 0 
            node = node.l;
        elseif input_seq(i) == 1
            node = node.r;
        else
            error('Invalid bit in input sequence');
        end
        %too slow O(n²)
        if isLeaf(node)
            if type == 'txt' 
                decode_c{end+1} = uint8(char(node.s));
                node = root;
            elseif type == 'dms'
                decode_c{end+1} = uint8(char(node.s)-'0');
                node = root;
            else
                %add code for img
                decode_c{end+1} = uint8(str2double(node.s));
                node = root;
            end
        end
    end
    output = [decode_c{:}];
    
end

function isLeaf = isLeaf(root)
    if (isempty(root.l) && isempty(root.r))
        isLeaf = 1;
    else
        isLeaf = 0; 
    end
end
%o_= huffman(huffman_structure,output_1212);