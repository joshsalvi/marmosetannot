annotationsfile = '/Users/joshsalvi/GitHub/vatic-docker/data/output.mat';

load(annotationsfile)
clear a label frames

disp('1')
q=1;
for j = 1:length(annotations)
    try
    b = (cell2mat(annotations{j}.attributes));
    a{q} = struct2array(b);a{q} = a{q}(isstrprop(a{q},'alpha'));
    label{q} = annotations{j}.label(annotations{j}.label~=' ');
    frames(q) = annotations{j}.frame;
    q=q+1;
    end
end
activities = unique(a);
animals = unique(label);

annot_vals{1} = zeros(length(activities),frames(end));annot_vals{2}=annot_vals{1};

disp('2')
for j = 1:length(a)
    q = find(cell2mat(cellfun(@(x) isempty(strfind(x,a{j}))==0,activities,'UniformOutput',0))==1);
    r = find(cell2mat(cellfun(@(x) isempty(strfind(x,label{j}))==0,animals,'UniformOutput',0))==1);
    annot_vals{r}(q,frames(j)) = 1;
end

