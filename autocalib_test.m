init;

cfg = {...
    'render', 1,...
    'debug', 0,...
    'max_trial_count', 500,...
    'reprojT_rgn', 3.5,...
    'reprojT_arc', 0.8,...
    'baselineT_rgn', 17,...
    'MaxIter', 50,...
    'irT', 0.5,...
};

img_path = fullfile(fileparts(mfilename('fullpath')),'data','img3.jpg');
solvers = [Solver2PC4CA, Solver6CA];
priors = [1, 1];
autocalib(img_path, solvers, priors, [], [], cfg{:});
