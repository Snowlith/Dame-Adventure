<?xml version="1.0" encoding="UTF-8"?>
<tileset version="1.10" tiledversion="1.10.2" name="Terrain" tilewidth="16" tileheight="32" tilecount="99" columns="11" objectalignment="center">
 <image source="../../sprites/terrain.png" width="176" height="288"/>
 <tile id="0">
  <objectgroup draworder="index" id="3">
   <object id="2" x="0" y="0">
    <polygon points="16,0 0,16 2,16 16,2"/>
   </object>
   <object id="3" x="0" y="0">
    <polygon points="0,32 16,16 16,32"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="1">
  <objectgroup draworder="index" id="2">
   <object id="1" x="0" y="0">
    <polygon points="0,0 16,0 16,2 0,2"/>
   </object>
   <object id="2" x="0" y="0">
    <polygon points="0,16 0,32 16,32 16,16"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="2">
  <objectgroup draworder="index" id="2">
   <object id="1" x="0" y="0">
    <polygon points="0,0 16,16 14,16 0,2"/>
   </object>
   <object id="2" x="0" y="0">
    <polygon points="0,16 16,32 0,32"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="3">
  <objectgroup draworder="index" id="2">
   <object id="1" x="0" y="0">
    <polygon points="14,16 16,14 16,16"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="4">
  <objectgroup draworder="index" id="2">
   <object id="1" x="0" y="0">
    <polygon points="0,14 0,16 2,16"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="11">
  <objectgroup draworder="index" id="2">
   <object id="1" x="0" y="0">
    <polygon points="0,0 0,16 2,16 2,0"/>
   </object>
   <object id="2" x="0" y="0">
    <polygon points="0,32 0,16 16,16 16,32"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="13">
  <objectgroup draworder="index" id="2">
   <object id="1" x="0" y="0">
    <polygon points="14,0 14,16 16,16 16,0"/>
   </object>
   <object id="2" x="0" y="0">
    <polygon points="0,32 0,16 16,16 16,32"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="14">
  <objectgroup draworder="index" id="2">
   <object id="1" x="0" y="0">
    <polygon points="14,0 16,0 16,2"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="15">
  <objectgroup draworder="index" id="2">
   <object id="1" x="0" y="0">
    <polygon points="0,0 2,0 0,2"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="22">
  <objectgroup draworder="index" id="2">
   <object id="1" x="0" y="0">
    <polygon points="0,0 16,16 16,14 2,0"/>
   </object>
   <object id="2" x="0" y="0">
    <polygon points="0,16 16,32 16,16"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="23">
  <objectgroup draworder="index" id="2">
   <object id="1" x="0" y="0">
    <polygon points="0,14 16,14 16,16 0,16"/>
   </object>
   <object id="2" x="0" y="0">
    <polygon points="0,16 0,32 16,32 16,16"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="24">
  <objectgroup draworder="index" id="2">
   <object id="1" x="0" y="0">
    <polygon points="0,16 16,0 14,0 0,14"/>
   </object>
   <object id="2" x="0" y="0">
    <polygon points="0,16 0,32 16,16"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="35">
  <objectgroup draworder="index" id="2">
   <object id="1" x="0" y="0">
    <polygon points="0,32 16,16 16,32"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="37">
  <objectgroup draworder="index" id="2">
   <object id="1" x="0" y="0">
    <polygon points="0,15 14,0 16,0 2,15"/>
   </object>
  </objectgroup>
 </tile>
 <wangsets>
  <wangset name="Natural Terrain" type="mixed" tile="-1">
   <wangcolor name="Dirt" color="#ff0000" tile="-1" probability="1"/>
   <wangcolor name="Dirt Stair  ˃" color="#00ff00" tile="-1" probability="1"/>
   <wangcolor name="Dirt Stair  ˄" color="#0000ff" tile="-1" probability="1"/>
   <wangcolor name="Dirt Stair  ˂" color="#ff7700" tile="-1" probability="1"/>
   <wangcolor name="[DO NOT USE] Stair Connector  ˃" color="#005500" tile="-1" probability="1"/>
   <wangcolor name="[DO NOT USE] Stair Connector  ˄" color="#00007f" tile="-1" probability="1"/>
   <wangcolor name="[DO NOT USE] Stair Connector  ˂" color="#aa5500" tile="-1" probability="1"/>
   <wangtile tileid="0" wangid="0,0,0,1,0,0,0,0"/>
   <wangtile tileid="1" wangid="0,0,0,1,0,1,0,0"/>
   <wangtile tileid="2" wangid="0,0,0,0,0,1,0,0"/>
   <wangtile tileid="3" wangid="0,1,0,0,0,1,0,1"/>
   <wangtile tileid="4" wangid="0,1,0,1,0,0,0,1"/>
   <wangtile tileid="11" wangid="0,1,0,1,0,0,0,0"/>
   <wangtile tileid="12" wangid="0,1,0,1,0,1,0,1"/>
   <wangtile tileid="13" wangid="0,0,0,0,0,1,0,1"/>
   <wangtile tileid="14" wangid="0,0,0,1,0,1,0,1"/>
   <wangtile tileid="15" wangid="0,1,0,1,0,1,0,0"/>
   <wangtile tileid="22" wangid="0,1,0,0,0,0,0,0"/>
   <wangtile tileid="23" wangid="0,1,0,0,0,0,0,1"/>
   <wangtile tileid="24" wangid="0,0,0,0,0,0,0,1"/>
   <wangtile tileid="33" wangid="0,1,0,1,0,0,5,0"/>
   <wangtile tileid="35" wangid="2,0,5,0,0,0,0,0"/>
   <wangtile tileid="36" wangid="2,0,5,0,2,0,0,0"/>
   <wangtile tileid="37" wangid="0,0,5,0,2,0,0,0"/>
   <wangtile tileid="44" wangid="0,1,0,0,6,0,0,1"/>
   <wangtile tileid="46" wangid="6,0,3,0,0,0,0,0"/>
   <wangtile tileid="47" wangid="6,0,3,0,0,0,3,0"/>
   <wangtile tileid="48" wangid="6,0,0,0,0,0,3,0"/>
   <wangtile tileid="55" wangid="0,0,7,0,0,1,0,1"/>
   <wangtile tileid="57" wangid="4,0,0,0,0,0,7,0"/>
   <wangtile tileid="58" wangid="4,0,0,0,4,0,7,0"/>
   <wangtile tileid="59" wangid="0,0,0,0,4,0,7,0"/>
  </wangset>
 </wangsets>
</tileset>
