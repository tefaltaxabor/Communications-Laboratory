function [output] = huffman(huffman_structure, input_seq) 
    root = huffman_structure.huffman_structure; %root = huffman_tree
    B    = huffman_structure.B;
    map_global = containers.Map("KeyType",'char',"ValueType",'any');
    function r(root,prefix)
        if isLeaf(root) == 1          
            map_global(char(root.s)) = uint8(prefix-'0');
            return;
        end
        %recursion
        if ~isempty(root.l)
            r(root.l,[prefix '0']) ; 
        end
        if ~isempty(root.r)
            r(root.r,[prefix '1']);
        end
    end
    r(root,'');
    
    num_syms = length(input_seq) / B;

    disp(keys(map_global));
    map_global
    chunks = cell(1,num_syms);
    idx = 1;
    for k = 1:num_syms
        sym = char(input_seq(idx:idx+B-1) + '0'); 
        idx = idx + B;
        
        %now O(n)
       
        if ~isKey(map_global, sym)
            %error('Símbolo no encontrado en el diccionario: "%s"', sym);
            continue;
        end
        chunks{k} = map_global(sym);
    end
    output = uint8([chunks{:}]);
end

function isLeaf = isLeaf(root)
    if (isempty(root.l) && isempty(root.r))
        isLeaf = 1;
    else
        isLeaf = 0; 
    end
end

%output_1212  = huffman(huffman_structure,uint8('1234312'))



