
```jldoctest
julia> using CAP; using CartesianCategories; using FinSetsForCAP

julia> true
true

julia> S = FinSet( 5 )
|5|

julia> T = FinSet( 3 )
|3|

julia> f1 = MapOfFinSets( S, [ 2, 2, 0, 1, 1 ], T )
|5| → |3|

julia> f2 = MapOfFinSets( S, [ 2, 1, 2, 0, 1 ], T )
|5| → |3|

julia> f3 = MapOfFinSets( S, [ 2, 0, 1, 0, 1 ], T )
|5| → |3|

julia> D = [ f1, f2, f3 ];

julia> Eq = Equalizer( D )
|2|

julia> iota = EmbeddingOfEqualizer( D )
|2| → |5|

julia> Display( iota )
[ 0, 1 ] ⱶ[ 0, 4 ]→ [ 0,..., 4 ]

julia> phi = MapOfFinSets( FinSet( 2 ), [ 4, 0 ], S );

julia> IsWellDefined( phi )
true

julia> psi = UniversalMorphismIntoEqualizer( D, phi )
|2| → |2|

julia> IsWellDefined( psi )
true

julia> Display( psi )
[ 0, 1 ] ⱶ[ 1, 0 ]→ [ 0, 1 ]

julia> PreCompose( psi, iota ) == phi
true

julia> D = [ f2, f3 ];

julia> Eq = Equalizer( D )
|3|

julia> psi = EmbeddingOfEqualizer( D )
|3| → |5|

julia> Display( psi )
[ 0, 1, 2 ] ⱶ[ 0, 3, 4 ]→ [ 0,..., 4 ]

```
