function [output] = huffman(huffman_structure, input_seq)
    root = huffman_structure.h; %root = huffman_tree
    e_dict = r(root);%funcion r
    output = e_dict(input_seq); %buscar 
end
% right 1 left 0 
function e_dict = r(root)
     if root.l == [] && root.r == [] && root.s == []
        root.l.s = 1;
        root.r.s = 0;
     else 
        root.s  
     end
    
     r(root.l);
     r(root.r);
end


function isLeaf = l(root)
    if root.l == [] && root.r == []
        isLeaf = 1;
    else
        isLeaf = 0; 
    end
end