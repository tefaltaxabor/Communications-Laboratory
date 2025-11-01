function [output] = huffman(huffman_structure,input_seq)
    root = huffman_structure.h; 
    node  = root;
    output_seq  = uint8([]);
    for i = 1:length(input_seq)
        if input_seq(i) == 0 
            node = node.l;
        elseif input_seq(i) == 1
            node = node.r;
        else
            error('Invalid bit in input sequence');
        end
        
        if isLeaf(node)
            output_seq = [output_seq, uint8(node.s-'0')];
            node = root;
        end
    end
    output = output_seq;
    
end

function isLeaf = isLeaf(root)
    if (isempty(root.l) && isempty(root.r))
        isLeaf = 1;
    else
        isLeaf = 0; 
    end
end
