function [huffman_structure] = create_huffman(M, pM, B)
    %creates labels with all possible combinations, and his respectives
    %probabilities
	a = string(M);
    p = pM;
    if not(sum(p) == 1)
        return;
    end
    for i = 1:B-1
        A = combinations(a,M);
        a = join(A{:,:},"");
        %t = table2array(A);
        P = combinations(p,pM);
        p = table2array(P);
        p = p(:,1).*p(:,2);
    end
    if numel(a) ~= numel(p)
        error('Length of the combinations unequal: |a|=%d, |p|=%d', numel(a), numel(p));
    end
    %sort by min. prob and store in dict  
    [p_s,i] = sort(p); 
    l_s = a(i);
    h = huffman_tree(l_s,p_s);
    %base_elem = length(M)^B;
    %create tree 
    %upward branches 0 , downward branches 1 
    huffman_structure = struct('M' , M, 'B' ,B ,'huffman_structure',h);
end
%basic struct
function h = huffman_tree(l_s,p_s)    
    nodes = cell(1, numel(p_s));
    for i = 1:numel(p_s)
        nodes{i} = makeNode(l_s{i}, p_s(i),[],[]); %no left no right 
    end
    h = huff_r(nodes);
end
function n = remaining_in_q(q,h)
    n = numel(q) - h + 1;
    if n < 0
        n = 0;
    end
end
%wikipedia 2 queues
function h = huff_r(nodes) 
    q_1 = nodes;
    h1 = 1;
    q_2 = {};
    h2=1; 
    function n = popmin()
        ren1 = remaining_in_q(q_1,h1);
        ren2 = remaining_in_q(q_2,h2);
        if ren1 > 0 && (ren2 == 0 || q_1{h1}.p <= q_2{h2}.p)
            n = q_1{h1}; h1 = h1 + 1;
        else
            n = q_2{h2}; h2 = h2 + 1;
        end
    end
    while remaining_in_q(q_1, h1) + remaining_in_q(q_2, h2)> 1
        a = popmin();
        b = popmin();
        new_node = makeNode([], a.p + b.p, a, b);
        q_2{end+1} = new_node;
    end
    h = popmin();
end
function node = makeNode(sym,prob,left,right)
    %hojas y nodos con hojas
    node = struct('s',sym,'p',prob,'l',left,'r',right);
end
%tic;        
%b = 8;
%[h,l_s,p_s] = create_huffman([1 2 3 4], [0.1 0.4 0.3 0.2], b);
%ft =  toc;
%fprintf('Tiempo de ejecución para B = %d: %.6f segundos\n',b, ft);