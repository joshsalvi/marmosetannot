annotationsfile = '/Users/joshsalvi/GitHub/vatic-docker/data/output.mat';

load(annotationsfile)
clear a

for j = 1:length(annotations)
    a{j} = struct2array(cell2mat(annotations{j}.attributes));
    frames(j) = annotations{j}.frame;
end
header = unique(a);
annot_vals = zeros(length(header),frames(end));

for j = 1:length(a)
    q = find(cell2mat(cellfun(@(x) isempty(strfind(x,a{j}))==0,header,'UniformOutput',0))==1);
    annot_vals(q,frames(j)) = 1;
end