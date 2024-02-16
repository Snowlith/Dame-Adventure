// rounds collider vertices

var roundColliderVertices = tiled.registerAction("RoundColliderVertices", function(action) {
    let tileset = tiled.activeAsset;
    if (!tileset || !tileset.isTileset)
        return;

    let tiles = tileset.selectedTiles;
    if (!tiles || tiles.length < 1)
        return;

    tileset.macro("Round Collider Vertices", function() {
        let numTiles = tiles.length;
        for (let i = 0; i < numTiles; i++) {
            let objectGroup = tiles[i].objectGroup;
            if (objectGroup) {
                let numObjects = objectGroup.objects.length;
                for (let j = 0; j < numObjects; j++) {
                    let collider = objectGroup.objects[j];
                    let x_offset = collider.x;
                    let y_offset = collider.y;
                    if (collider.polygon) {
                        let copy = [...collider.polygon];
                        for (let k = 0; k < collider.polygon.length; k++) {
                            copy[k].x = Math.round(collider.polygon[k].x+x_offset);
                            copy[k].y = Math.round(collider.polygon[k].y+y_offset);
                        }
                        collider.x = 0;
                        collider.y = 0;
                        collider.polygon = copy;
                    } else if (collider.polyline) {
                        let copy = [...collider.polyline];
                        for (let k = 0; k < collider.polyline.length; k++) {
                            copy[k].x = Math.round(collider.polyline[k].x);
                            copy[k].y = Math.round(collider.polyline[k].y);
                        }
                        collider.x = 0;
                        collider.y = 0;
                        collider.polyline = copy;
                    }
                }
            }
        }
    });
});

roundColliderVertices.text = "Round Collider Vertices";

// Only show this action in the Tileset editor:
roundColliderVertices.onAssetChanged = function() {
    let asset = tiled.activeAsset;
    if (asset && asset.isTileset) {
        roundColliderVertices.enabled = true;
        roundColliderVertices.visible = true;
    } else {
        roundColliderVertices.enabled = false;
        roundColliderVertices.visible = false;
    }
}

roundColliderVertices.onAssetChanged(); // Make sure the actions have the correct state on load
tiled.activeAssetChanged.connect(roundColliderVertices.onAssetChanged);

// Tileset right-click menu:
tiled.extendMenu("TilesetView.Tiles", [
    { separator: true },
    { action: "RoundColliderVertices"}
]);