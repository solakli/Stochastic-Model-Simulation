function [minimum,fval] = anneal(loss, parent, options)
itry = 0;
def = struct(...
        'CoolSched',@(T) (T*(0.8)),...
        'Generator',@(x) (-500 + (1000).*rand(1,2)),...
        'InitTemp',100,...
        'MaxConsRej',1000,...
        'MaxSuccess',20,...
        'MaxTries',500,...
        'StopTemp',1e-8,...
        'StopVal',-Inf,...
        'Verbosity',1);

% Check input
if ~nargin %user wants default options, give it and stop
    minimum = def;
    return
elseif nargin<2 %user gave only objective function, throw error
    error('MATLAB:anneal:noParent','You need to input a first guess.');
elseif nargin<3 %user gave no options structure, use default
    options=def;
else %user gave all input, check if options structure is complete
    if ~isstruct(options)
        error('MATLAB:anneal:badOptions',...
            'Input argument ''options'' is not a structure')
    end
    fs = {'CoolSched','Generator','InitTemp','MaxConsRej',...
        'MaxSuccess','MaxTries','StopTemp','StopVal','Verbosity'};
    for nm=1:length(fs)
        if ~isfield(options,fs{nm}), options.(fs{nm}) = def.(fs{nm}); end
    end
end

% main settings
newsol = options.Generator;      % neighborhood space function
Tinit = options.InitTemp;        % initial temp
minT = options.StopTemp;         % stopping temp
cool = options.CoolSched;        % annealing schedule
minF = options.StopVal;
max_consec_rejections = options.MaxConsRej;
max_try = options.MaxTries;
max_success = options.MaxSuccess;
report = options.Verbosity;
k = 1;                           % boltzmann constant

% counters etc
success = 0;
finished = 0;
consec = 0;
T = Tinit;
initenergy = loss(parent);
oldenergy = initenergy;
total = 0;
if report==2, fprintf(1,'\n  T = %7.5f, loss = %10.5f\n',T,oldenergy); end

while ~finished
    itry = itry+1; % just an iteration counter
    current = parent; 
    
    % % Stop / decrement T criteria
    if itry >= max_try || success >= max_success
        if T < minT || consec >= max_consec_rejections
            finished = 1;
            total = total + itry;
            break;
        else
            T = cool(T);  % decrease T according to cooling schedule
            if report==2 % output
                fprintf(1,'  T = %7.5f, loss = %10.5f\n',T,oldenergy);
            end
            total = total + itry;
            itry = 1;
            success = 1;
        end
    end
    
    newparam = newsol(current);
    newenergy = loss(newparam);
    
    if (newenergy < minF),
        parent = newparam; 
        oldenergy = newenergy;
        break
    end
    
    if (oldenergy-newenergy > 1e-6)
        parent = newparam;
        oldenergy = newenergy;
        success = success+1;
        consec = 0;
    else
        if (rand < exp( (oldenergy-newenergy)/(k*T) ))
            parent = newparam;
            oldenergy = newenergy;
            success = success+1;
        else
            consec = consec+1;
        end
    end
end

minimum = parent;
fval = oldenergy;

if report
    fprintf(1, '\n  Initial temperature:     \t%g\n', Tinit);
    fprintf(1, '  Final temperature:       \t%g\n', T);
    fprintf(1, '  Consecutive rejections:  \t%i\n', consec);
    fprintf(1, '  Number of function calls:\t%i\n', total);
    fprintf(1, '  Total final loss:        \t%g\n', fval);
end
