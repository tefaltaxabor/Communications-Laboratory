function [output] = huffman(huffman_structure, input_seq) 
    root = huffman_structure.huffman_structure; %root = huffman_tree
    B    = huffman_structure.B;
    type = huffman_structure.type;
    function r(root,prefix)
    if isLeaf(root) == 1          
        map_global(char(root.s)) = uint8(prefix-'0');
        return;
    end
    %recursion
    if ~isempty(root.l)
        r(root.l,[prefix '0']); 
    end
    if ~isempty(root.r)
        r(root.r,[prefix '1']);
    end
    end

    function r_(root,prefix)
    if isLeaf(root) == 1
        map_global(uint32(str2double(root.s))) = uint8(prefix-'0');
        return;
    end
    %recursion
    if ~isempty(root.l)
        r_(root.l,[prefix '0']); 
    end
    if ~isempty(root.r)
         r_(root.r,[prefix '1']);
    end
    end
    
    if strcmp(type, 'img')
        map_global = containers.Map("KeyType",'uint32',"ValueType",'any');
    else
        map_global = containers.Map("KeyType",'char',"ValueType",'any');
    end
    is_text_type = strcmp(type,'dms') || strcmp(type,'txt');
    if is_text_type
        r(root,'');
    else
        r_(root,'');
    end
    num_syms = length(input_seq) / B;

    disp(keys(map_global));
    disp(map_global.values)
    chunks = cell(1,num_syms);
    idx = 1;
    for k = 1:num_syms
        if type == 'txt' 
            sym = char(input_seq(idx:idx+B-1)); 
            idx = idx + B;
        elseif type == 'dms'
            %disp('tumama')
            sym = char(input_seq(idx:idx+B-1) + '0'); 
            idx = idx + B;
        elseif type == 'img'
            %add code for img 
            sym = input_seq(idx:idx+B-1);
            %if k == 1
            %    disp(sym)
            %end
            idx = idx + B;
        end
        
        %now O(n)
       
        if ~isKey(map_global, sym)
            disp(sym)
            disp(k)
            error('Símbolo no encontrado en el diccionario: "%s"', sym);
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

output_1212  = huffman(huffman_structure,diff_seq);


