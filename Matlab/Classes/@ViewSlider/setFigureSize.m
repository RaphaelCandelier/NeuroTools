function setFigureSize(this)

% --- Compute display dimensions
this.dispWidth = 0;
this.dispHeight = 0;
for i = 1:numel(this.stack)
    this.dispWidth = max(this.dispWidth, floor(size(this.stack(i).data,2)/this.zoom));
    this.dispHeight = max(this.dispHeight, floor(size(this.stack(i).data,1)/this.zoom));
end

% --- Update figure and axes sizes
set(this.axes, 'position', [0 this.sliderHeight this.dispWidth this.dispHeight]);
drawnow
            
fpos = get(this.fig, 'Position');
set(this.fig, 'Position', [fpos(1:2) this.dispWidth this.dispHeight+this.sliderHeight]);
           
set(this.slider, 'position', [0 0 this.dispWidth this.sliderHeight]);

% Update image
this.update('reset');