
```jldoctest
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> s = FinSet( 5 )
|5|

julia> t = FinSet( 4 )
|4|

julia> f = MapOfFinSets( s, [ 2, 3, 3, 1, 3 ], t )
|5| → |4|

julia> g = MapOfFinSets( s, [ 2, 2, 3, 1, 3 ], t )
|5| → |4|

julia> D = [ f, g ];

julia> C = Coequalizer( D )
|3|

julia> pi = ProjectionOntoCoequalizer( D )
|4| → |3|

julia> Display( pi )
[ 0,..., 3 ] ⱶ[ 0, 1, 2, 2 ]→ [ 0, 1, 2 ]

julia> tau = MapOfFinSets( t, [ 1, 0, 1, 1 ], FinSet( 2 ) )
|4| → |2|

julia> phi = UniversalMorphismFromCoequalizer( D, tau )
|3| → |2|

julia> Display( phi )
[ 0, 1, 2 ] ⱶ[ 1, 0, 1 ]→ [ 0, 1 ]

julia> PreCompose( pi, phi ) == tau
true

julia> s = FinSet( 5 )
|5|

julia> t = FinSet( 4 )
|4|

julia> f = MapOfFinSets( s, [ 1, 2, 2, 1, 3 ], t )
|5| → |4|

julia> g = MapOfFinSets( s, [ 1, 2, 1, 1, 3 ], t )
|5| → |4|

julia> D = [ f, g ];

julia> C = Coequalizer( D )
|3|

julia> pi = ProjectionOntoCoequalizer( D )
|4| → |3|

julia> Display( pi )
[ 0,..., 3 ] ⱶ[ 0, 1, 1, 2 ]→ [ 0, 1, 2 ]

julia> PreCompose( f, pi ) == PreCompose( g, pi )
true

julia> tau = MapOfFinSets( t, [ 0, 1, 1, 0 ], FinSet( 2 ) )
|4| → |2|

julia> phi = UniversalMorphismFromCoequalizer( D, tau )
|3| → |2|

julia> Display( phi )
[ 0, 1, 2 ] ⱶ[ 0, 1, 0 ]→ [ 0, 1 ]

julia> PreCompose( pi, phi ) == tau
true

julia> s = FinSet( 2 );

julia> t = FinSet( 3 );

julia> f = MapOfFinSets( s, [ 0, 1 ], t );

julia> IsWellDefined( f )
true

julia> g = MapOfFinSets( s, [ 1, 2 ], t );

julia> IsWellDefined( g )
true

julia> C = Coequalizer( [ f, g ] )
|1|

```