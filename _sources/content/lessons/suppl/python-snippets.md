# Python-snippets


`````{tab-set}
````{tab-item} Tie Point Filter
```
import Metashape
from pathlib import Path

def progress_print(p):
        print('Current task progress: {:.2f}%'.format(p))

class metashape_tiepoint_filter:
    def __init__(self,ms_path: Path):

        if not ms_path == None:
            self.doc = Metashape.Document()
            self.doc.open(ms_path.as_posix())
        else:
            self.doc = Metashape.app.document
        self.chunk = self.doc.chunk
        self.total_tie_points = len(self.chunk.tie_points.points)

    def standard_run(self):
        if len(self.chunk.point_clouds) == 0:
            self.filter_reconstruction_uncertainty()
            self.optimize_cameras()
            self.doc.save()
            self.filter_projection_accuracy()
            self.optimize_cameras()
            self.doc.save()
            self.filter_reprojection_error()
            self.optimize_cameras()
            set_label_naming_template()
            self.doc.save()
        else:
            print("Dense cloud exists... Ignoring..")

    def optimize_cameras(self, parameters = None):
        print("optimize_cameras")

        self.chunk.optimizeCameras(
            tiepoint_covariance=True,
            progress=progress_print
        )
        
    def filter_reconstruction_uncertainty(self, x = 10):
        print("filter_reconstruction_uncertainty")
        self.chunk = self.chunk.copy()
        f = Metashape.TiePoints.Filter()
        f.init(self.chunk, criterion = Metashape.TiePoints.Filter.ReconstructionUncertainty)
        while (len([i for i in f.values if i >= x])/self.total_tie_points) >= 0.5:
            x += 0.1
        x = round(x,1)
        self.chunk.label = f"RecUnc={x}"
        f.removePoints(x)
        
    def filter_projection_accuracy(self, x = 2):
        print("filter_projection_accuracy")
        self.chunk = self.chunk.copy()
        f = Metashape.TiePoints.Filter()
        f.init(self.chunk, criterion = Metashape.TiePoints.Filter.ProjectionAccuracy)
        while (len([i for i in f.values if i >= x])/len(self.chunk.tie_points.points)) >= 0.5:
            x += 0.1
        x = round(x,1)
        self.chunk.label = f"{self.chunk.label.split('Copy of ')[1]}_ProjAcc={x}"
        f.removePoints(x)
        
    def filter_reprojection_error(self, x = 0.3):
        print("filter_reprojection_error")
        self.chunk = self.chunk.copy()
        f = Metashape.TiePoints.Filter()
        f.init(self.chunk, criterion = Metashape.TiePoints.Filter.ReprojectionError)
        #while (len([i for i in f.values if i >= x])/self.total_tie_points) <= 0.9:
        #    x -= 0.005
        #    print(x)
        #x = round(x,3)
        self.chunk.label = f"{self.chunk.label.split('Copy of ')[1]}_RepErr={x}"
        f.removePoints(x)

    def set_label_naming_template(self):
        self.chunk.label = f"{self.chunk.label}_PcConf=XX_MeshCC=XX"

a = metashape_tiepoint_filter(None)
a.standard_run()



```
````
