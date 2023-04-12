
```jldoctest
julia> using CAP; using CartesianCategories; using FinSetsForCAP

julia> true
true

julia> N = FinSet( [1,3] )
<An object in FinSets>

julia> M = FinSet( [1,2,4] )
<An object in FinSets>

julia> f = MapOfFinSets( N, [ [1,1], [3,2] ], M )
<A morphism in FinSets>

julia> g = MapOfFinSets( N, [ [1,2], [3,4] ], M )
<A morphism in FinSets>

julia> C = Coequalizer( f, g )
<An object in FinSets>

julia> Display( AsList( C ) )
[ [ 1, 2, 4 ] ]

julia> A = FinSet( [ 1, 2, 3, 4 ] )
<An object in FinSets>

julia> B = FinSet( [ 1, 2, 3, 4, 5, 6, 7, 8 ] )
<An object in FinSets>

julia> f1 = MapOfFinSets( A, [ [ 1, 1 ], [ 2, 2 ], [ 3, 3 ], [ 4, 8 ] ], B )
<A morphism in FinSets>

julia> f2 = MapOfFinSets( A, [ [ 1, 2 ], [ 2, 3 ], [ 3, 8 ], [ 4, 5 ] ], B )
<A morphism in FinSets>

julia> f3 = MapOfFinSets( A, [ [ 1, 4 ], [ 2, 2 ], [ 3, 3 ], [ 4, 8 ] ], B )
<A morphism in FinSets>

julia> C1 = Coequalizer( [ f1, f3 ] )
<An object in FinSets>

julia> Display( AsList( C1 ) )
[ [ 1, 4 ], [ 2 ], [ 3 ], [ 5 ], [ 6 ], [ 7 ], [ 8 ] ]

julia> C2 = Coequalizer( [ f1, f2, f3 ] )
<An object in FinSets>

julia> Display( AsList( C2 ) )
[ [ 1, 2, 3, 8, 5, 4 ], [ 6 ], [ 7 ] ]

julia> S = FinSet( (1):(5) )
<An object in FinSets>

julia> T = FinSet( (1):(4) )
<An object in FinSets>

julia> f = MapOfFinSets( S, [ [1,2], [2,4], [3,4], [4,3], [5,4] ], T )
<A morphism in FinSets>

julia> g = MapOfFinSets( S, [ [1,2], [2,3], [3,4], [4,3], [5,4] ], T )
<A morphism in FinSets>

julia> C = Coequalizer( f, g )
<An object in FinSets>

julia> Display( C )
[ [ 1 ], [ 2 ], [ 4, 3 ] ]

julia> S = FinSet( [ 1, 2, 3, 4, 5 ] )
<An object in FinSets>

julia> T = FinSet( [ 1, 2, 3, 4 ] )
<An object in FinSets>

julia> G_f = [ [ 1, 3 ], [ 2, 4 ], [ 3, 4 ], [ 4, 2 ], [ 5, 4 ] ];

julia> f = MapOfFinSets( S, G_f, T )
<A morphism in FinSets>

julia> G_g = [ [ 1, 3 ], [ 2, 3 ], [ 3, 4 ], [ 4, 2 ], [ 5, 4 ] ];

julia> g = MapOfFinSets( S, G_g, T )
<A morphism in FinSets>

julia> D = [ f, g ];

julia> C = Coequalizer( D )
<An object in FinSets>

julia> Display( AsList( C ) )
[ [ 1 ], [ 2 ], [ 3, 4 ] ]

julia> pi = ProjectionOntoCoequalizer( D )
<A morphism in FinSets>

julia> Display( AsList( pi ) )
[ [ 1, [ 1 ] ], [ 2, [ 2 ] ], [ 3, [ 3, 4 ] ], [ 4, [ 3, 4 ] ] ]

julia> mu = MorphismFromSourceToCoequalizer( D );

julia> PreCompose( f, pi ) == mu
true

julia> G_tau = [ [ 1, 2 ], [ 2, 1 ], [ 3, 2 ], [ 4, 2 ] ];

julia> tau = MapOfFinSets( T, G_tau, FinSet( [ 1, 2 ] ) )
<A morphism in FinSets>

julia> phi = UniversalMorphismFromCoequalizer( D, tau )
<A morphism in FinSets>

julia> Display( AsList( phi ) )
[ [ [ 1 ], 2 ], [ [ 2 ], 1 ], [ [ 3, 4 ], 2 ] ]

julia> PreCompose( pi, phi ) == tau
true

julia> S = FinSet( [ 1, 2, 3, 4, 5 ] )
<An object in FinSets>

julia> T = FinSet( [ 1, 2, 3, 4 ] )
<An object in FinSets>

julia> G_f = [ [ 1, 2 ], [ 2, 3 ], [ 3, 3 ], [ 4, 2 ], [ 5, 4 ] ];

julia> f = MapOfFinSets( S, G_f, T )
<A morphism in FinSets>

julia> G_g = [ [ 1, 2 ], [ 2, 3 ], [ 3, 2 ], [ 4, 2 ], [ 5, 4 ] ];

julia> g = MapOfFinSets( S, G_g, T )
<A morphism in FinSets>

julia> D = [ f, g ];

julia> C = Coequalizer( D )
<An object in FinSets>

julia> Display( AsList( C ) )
[ [ 1 ], [ 2, 3 ], [ 4 ] ]

julia> pi = ProjectionOntoCoequalizer( D )
<A morphism in FinSets>

julia> Display( AsList( pi ) )
[ [ 1, [ 1 ] ], [ 2, [ 2, 3 ] ], [ 3, [ 2, 3 ] ], [ 4, [ 4 ] ] ]

julia> PreCompose( f, pi ) == PreCompose( g, pi )
true

julia> mu = MorphismFromSourceToCoequalizer( D );

julia> PreCompose( f, pi ) == mu
true

julia> G_tau = [ [ 1, 1 ], [ 2, 2 ], [ 3, 2 ], [ 4, 1 ] ];

julia> tau = MapOfFinSets( T, G_tau, FinSet( [ 1, 2 ] ) )
<A morphism in FinSets>

julia> phi = UniversalMorphismFromCoequalizer( D, tau )
<A morphism in FinSets>

julia> Display( AsList( phi ) )
[ [ [ 1 ], 1 ], [ [ 2, 3 ], 2 ], [ [ 4 ], 1 ] ]

julia> PreCompose( pi, phi ) == tau
true

julia> A = FinSet( [ "A" ] )
<An object in FinSets>

julia> B = FinSet( [ "B" ] )
<An object in FinSets>

julia> M = FinSetNC( [ A, B ] )
<An object in FinSets>

julia> f = MapOfFinSetsNC( M, [ [ A, A ], [ B, A ] ], M )
<A morphism in FinSets>

julia> g = IdentityMorphism( M )
<A morphism in FinSets>

julia> C = Coequalizer( [ f, g ] )
<An object in FinSets>

julia> Length( C )
1

julia> Length( AsList( C )[ 1 ] )
2

julia> Display( AsList( C )[ 1 ][ 1 ] )
[ "A" ]

julia> Display( AsList( C )[ 1 ][ 2 ] )
[ "B" ]

```
