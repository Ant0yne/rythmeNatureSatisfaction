extends Node

var premiere_position = Vector2(609,50)
var nbre_bonne_position = int(0)
var puzzle_fini = int(100)

var liste_piece = [
'Piece',
'@Piece@2',
'@Piece@3',
'@Piece@4',
'@Piece@5',
'@Piece@6',
'@Piece@7',
'@Piece@8',
'@Piece@9',
'@Piece@10',
'@Piece@11',
'@Piece@12',
'@Piece@13',
'@Piece@14',
'@Piece@15',
'@Piece@16',
'@Piece@17',
'@Piece@18',
'@Piece@19',
'@Piece@20',
'@Piece@21',
'@Piece@22',
'@Piece@23',
'@Piece@24',
'@Piece@25',
'@Piece@26',
'@Piece@27',
'@Piece@28',
'@Piece@29',
'@Piece@30',
'@Piece@31',
'@Piece@32',
'@Piece@33',
'@Piece@34',
'@Piece@35',
'@Piece@36',
'@Piece@37',
'@Piece@38',
'@Piece@39',
'@Piece@40',
'@Piece@41',
'@Piece@42',
'@Piece@43',
'@Piece@44',
'@Piece@45',
'@Piece@46',
'@Piece@47',
'@Piece@48',
'@Piece@49',
'@Piece@50',
'@Piece@51',
'@Piece@52',
'@Piece@53',
'@Piece@54',
'@Piece@55',
'@Piece@56',
'@Piece@57',
'@Piece@58',
'@Piece@59',
'@Piece@60',
'@Piece@61',
'@Piece@62',
'@Piece@63',
'@Piece@64',
'@Piece@65',
'@Piece@66',
'@Piece@67',
'@Piece@68',
'@Piece@69',
'@Piece@70',
'@Piece@71',
'@Piece@72',
'@Piece@73',
'@Piece@74',
'@Piece@75',
'@Piece@76',
'@Piece@77',
'@Piece@78',
'@Piece@79',
'@Piece@80',
'@Piece@81',
'@Piece@82',
'@Piece@83',
'@Piece@84',
'@Piece@85',
'@Piece@86',
'@Piece@87',
'@Piece@88',
'@Piece@89',
'@Piece@90',
'@Piece@91',
'@Piece@92',
'@Piece@93',
'@Piece@94',
'@Piece@95',
'@Piece@96',
'@Piece@97',
'@Piece@98',
'@Piece@99',
'@Piece@100',
]

var liste_positons = [
Vector2(609,50),
Vector2(677,50),
Vector2(745,50),
Vector2(813,50),
Vector2(881,50),
Vector2(949,50),
Vector2(1017,50),
Vector2(1085,50),
Vector2(1153,50),
Vector2(1221,50),

Vector2(609,118),
Vector2(677,118),
Vector2(745,118),
Vector2(813,118),
Vector2(881,118),
Vector2(949,118),
Vector2(1017,118),
Vector2(1085,118),
Vector2(1153,118),
Vector2(1221,118),

Vector2(609,186),
Vector2(677,186),
Vector2(745,186),
Vector2(813,186),
Vector2(881,186),
Vector2(949,186),
Vector2(1017,186),
Vector2(1085,186),
Vector2(1153,186),
Vector2(1221,186),

Vector2(609,254),
Vector2(677,254),
Vector2(745,254),
Vector2(813,254),
Vector2(881,254),
Vector2(949,254),
Vector2(1017,254),
Vector2(1085,254),
Vector2(1153,254),
Vector2(1221,254),

Vector2(609,322),
Vector2(677,322),
Vector2(745,322),
Vector2(813,322),
Vector2(881,322),
Vector2(949,322),
Vector2(1017,322),
Vector2(1085,322),
Vector2(1153,322),
Vector2(1221,322),

Vector2(609,390),
Vector2(677,390),
Vector2(745,390),
Vector2(813,390),
Vector2(881,390),
Vector2(949,390),
Vector2(1017,390),
Vector2(1085,390),
Vector2(1153,390),
Vector2(1221,390),

Vector2(609,458),
Vector2(677,458),
Vector2(745,458),
Vector2(813,458),
Vector2(881,458),
Vector2(949,458),
Vector2(1017,458),
Vector2(1085,458),
Vector2(1153,458),
Vector2(1221,458),

Vector2(609,526),
Vector2(677,526),
Vector2(745,526),
Vector2(813,526),
Vector2(881,526),
Vector2(949,526),
Vector2(1017,526),
Vector2(1085,526),
Vector2(1153,526),
Vector2(1221,526),

Vector2(609,594),
Vector2(677,594),
Vector2(745,594),
Vector2(813,594),
Vector2(881,594),
Vector2(949,594),
Vector2(1017,594),
Vector2(1085,594),
Vector2(1153,594),
Vector2(1221,594),

Vector2(609,662),
Vector2(677,662),
Vector2(745,662),
Vector2(813,662),
Vector2(881,662),
Vector2(949,662),
Vector2(1017,662),
Vector2(1085,662),
Vector2(1153,662),
Vector2(1221,662),
]
