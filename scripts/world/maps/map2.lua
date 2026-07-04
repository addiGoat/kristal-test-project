return {
  version = "1.11",
  luaversion = "5.1",
  tiledversion = "1.12.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 7,
  nextobjectid = 25,
  properties = {},
  tilesets = {
    {
      name = "example_tileset",
      firstgid = 1,
      filename = "../tilesets/example_tileset.tsx",
      exportfilename = "../tilesets/example_tileset.lua"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 12,
      id = 1,
      name = "Tile Layer 1",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23,
        23, 1, 2, 2, 2, 2, 2, 2, 2, 2, 3, 23, 23, 23, 23, 23,
        2, 11, 8, 8, 8, 8, 8, 8, 8, 8, 9, 23, 23, 23, 23, 23,
        8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9, 23, 23, 23, 23, 23,
        14, 5, 8, 8, 8, 8, 8, 8, 8, 8, 9, 23, 23, 23, 23, 23,
        23, 7, 8, 8, 8, 8, 8, 8, 8, 8, 9, 23, 23, 23, 23, 23,
        23, 7, 8, 8, 8, 8, 8, 8, 8, 8, 9, 23, 23, 23, 23, 23,
        23, 13, 14, 14, 14, 14, 14, 14, 14, 14, 15, 23, 23, 23, 23, 23,
        23, 19, 20, 20, 20, 20, 20, 20, 20, 20, 21, 23, 23, 23, 23, 23,
        23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23,
        23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23,
        23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "markers",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 19,
          name = "spawn",
          type = "",
          shape = "point",
          x = 40.6667,
          y = 142.667,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "exit ",
          type = "",
          shape = "point",
          x = 244,
          y = 238,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "collision",
      class = "",
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 320,
          width = 400,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 440,
          y = 40,
          width = 40,
          height = 280,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 200,
          width = 40,
          height = 120,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 40,
          width = 40,
          height = 40,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "objects",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 21,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = -40,
          y = 80,
          width = 40,
          height = 120,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["facing"] = "left",
            ["map"] = "example_map",
            ["marker"] = "exit"
          }
        },
        {
          id = 22,
          name = "chest",
          type = "",
          shape = "point",
          x = 240,
          y = 160,
          width = 0,
          height = 0,
          rotation = 0,
          opacity = 1,
          visible = true,
          properties = {
            ["money"] = 100
          }
        }
      }
    }
  }
}
