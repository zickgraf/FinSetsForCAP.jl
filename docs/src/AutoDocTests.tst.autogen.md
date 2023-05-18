
```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> S = FinSet( [ 1, 3, 2, 2, 1 ] )
<An object in FinSets>

julia> Display( S )
[ 1, 2, 3 ]

julia> L = AsList( S );

julia> Display( L )
[ 1, 2, 3 ]

julia> Q = FinSet( L )
<An object in FinSets>

julia> S == Q
true

julia> FinSet( [ 1, 2 ] ) == FinSet( [ 2, 1 ] )
true

julia> M = FinSetNC( [ 1, 2, 3, 3 ] )
<An object in FinSets>

julia> IsWellDefined( M )
false

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> S = FinSetNC( [ 1, 3, 2 ] )
<An object in FinSets>

julia> Display( S )
[ 1, 3, 2 ]

julia> L = AsList( S );

julia> Display( L )
[ 1, 3, 2 ]

julia> Q = FinSetNC( L )
<An object in FinSets>

julia> S == Q
true

julia> S = ObjectConstructor( FinSets, [ 1, 3, 2 ] )
<An object in FinSets>

julia> Display( S )
[ 1, 3, 2 ]

julia> L = ObjectDatum( S );

julia> Display( L )
[ 1, 3, 2 ]

julia> Q = ObjectConstructor( FinSets, L )
<An object in FinSets>

julia> S == Q
true

julia> FinSetNC( [ 1, 2 ] ) == FinSetNC( [ 2, 1 ] )
false

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> S = FinSet( [ 1, 3, 2, 2, 1 ] )
<An object in FinSets>

julia> T = FinSet( [ "a", "b", "c" ] )
<An object in FinSets>

julia> G = [ [ 1, "b" ], [ 3, "b" ], [ 2, "a" ] ];

julia> phi = MapOfFinSets( S, G, T )
<A morphism in FinSets>

julia> IsWellDefined( phi )
true

julia> Display( AsList( phi ) )
[ [ 1, "b" ], [ 2, "a" ], [ 3, "b" ] ]

julia> phi2 = MorphismConstructor( S, G, T )
<A morphism in FinSets>

julia> Display( MorphismDatum( phi2 ) )
[ [ 1, "b" ], [ 2, "a" ], [ 3, "b" ] ]

julia> phi == phi2
true

julia> phi( 1 )
"b"

julia> phi( 2 )
"a"

julia> phi( 3 )
"b"

julia> Display( List( S, phi ) )
[ "b", "a", "b" ]

julia> psi = [ [ 1, "b" ], [ 2, "a" ], [ 3, "b" ] ];

julia> psi = MapOfFinSets( S, psi, T )
<A morphism in FinSets>

julia> IsWellDefined( psi )
true

julia> phi == psi
true

julia> psi = MapOfFinSets( S, [ [ 1, "d" ], [ 3, "b" ] ], T )
<A morphism in FinSets>

julia> IsWellDefined( psi )
false

julia> psi = MapOfFinSets( S, [ 1, 2, 3 ], T )
<A morphism in FinSets>

julia> IsWellDefined( psi )
false

julia> psi = MapOfFinSets( S, [ [ 1, "b" ], [ 3, "b" ], [ 2, "a", "b" ] ], T )
<A morphism in FinSets>

julia> IsWellDefined( psi )
false

julia> psi = MapOfFinSets( S, [ [ 5, "b" ], [ 3, "b" ], [ 2, "a" ] ], T )
<A morphism in FinSets>

julia> IsWellDefined( psi )
false

julia> psi = MapOfFinSets( S, [ [ 1, "d" ], [ 3, "b" ], [ 2, "a" ] ], T )
<A morphism in FinSets>

julia> IsWellDefined( psi )
false

julia> psi = MapOfFinSets( S, [ [ 1, "b" ], [ 2, "b" ], [ 2, "a" ] ], T )
<A morphism in FinSets>

julia> IsWellDefined( psi )
false

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> S = FinSetNC( [ 1, 3, 2 ] )
<An object in FinSets>

julia> T = FinSetNC( [ "a", "b", "c" ] )
<An object in FinSets>

julia> G = [ [ 1, "b" ], [ 3, "b" ], [ 2, "a" ] ];

julia> phi = MapOfFinSetsNC( S, G, T )
<A morphism in FinSets>

julia> IsWellDefined( phi )
true

julia> phi( 1 )
"b"

julia> phi( 2 )
"a"

julia> phi( 3 )
"b"

julia> Display( List( S, phi ) )
[ "b", "b", "a" ]

julia> psi = [ [ 1, "b" ], [ 2, "a" ], [ 3, "b" ] ];

julia> psi = MapOfFinSetsNC( S, psi, T )
<A morphism in FinSets>

julia> IsWellDefined( psi )
true

julia> phi == psi
true

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> IsEqualForElementsOfFinSets( 2, 2 )
true

julia> IsEqualForElementsOfFinSets( 2, "2" )
false

julia> IsEqualForElementsOfFinSets( 'a', 'a' )
true

julia> IsEqualForElementsOfFinSets( 'a', 'b' )
false

julia> IsEqualForElementsOfFinSets( [ 2 ], [ 2 ] )
true

julia> IsEqualForElementsOfFinSets( [ 2 ], [ 2, 3 ] )
false

julia> IsEqualForElementsOfFinSets( @rec( a = "a", b = "b" ),
                                     @rec( b = "b", a = "a" )
                                   )
true

julia> IsEqualForElementsOfFinSets( @rec( a = "a", b = "b" ),
                                     @rec( a = "a" )
                                   )
false

julia> IsEqualForElementsOfFinSets( @rec( a = "a", b = "b" ),
                                     @rec( a = "a", b = "notb" )
                                   )
false

julia> M = FinSet( [ ] );

julia> N = FinSet( [ ] );

julia> m = FinSet( 0 );

julia> id_M = IdentityMorphism( M );

julia> id_N = IdentityMorphism( N );

julia> id_m = IdentityMorphism( m );

julia> IsEqualForElementsOfFinSets( M, N )
true

julia> IsEqualForElementsOfFinSets( M, m )
false

julia> IsEqualForElementsOfFinSets( id_M, id_N )
true

julia> IsEqualForElementsOfFinSets( id_M, id_m )
false

julia> IsEqualForElementsOfFinSets( FinSets, SkeletalFinSets )
false

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> L = FinSet( [ ] )
<An object in FinSets>

julia> M = FinSet( [ 2 ] )
<An object in FinSets>

julia> N = FinSet( [ 3 ] )
<An object in FinSets>

julia> IsHomSetInhabited( L, L )
true

julia> IsHomSetInhabited( M, L )
false

julia> IsHomSetInhabited( L, M )
true

julia> IsHomSetInhabited( M, N )
true

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> L = FinSet( 0 )
|0|

julia> M = FinSet( 2 )
|2|

julia> N = FinSet( 3 )
|3|

julia> Display( MorphismsOfExternalHom( L, L ) )
[ ∅ ⱶ[ ]→ ∅ ]

julia> Display( MorphismsOfExternalHom( M, L ) )
[  ]

julia> Display( MorphismsOfExternalHom( L, M ) )
[ ∅ ⱶ[ ]→ [ 0, 1 ] ]

julia> Display( MorphismsOfExternalHom( M, N ) )
[ [ 0, 1 ] ⱶ[ 0, 0 ]→ [ 0, 1, 2 ], [ 0, 1 ] ⱶ[ 1, 0 ]→ [ 0, 1, 2 ], [ 0, 1 ] ⱶ[ 2, 0 ]→ [ 0, 1, 2 ], [ 0, 1 ] ⱶ[ 0, 1 ]→ [ 0, 1, 2 ], [ 0, 1 ] ⱶ[ 1, 1 ]→ [ 0, 1, 2 ], [ 0, 1 ] ⱶ[ 2, 1 ]→ [ 0, 1, 2 ], [ 0, 1 ] ⱶ[ 0, 2 ]→ [ 0, 1, 2 ], [ 0, 1 ] ⱶ[ 1, 2 ]→ [ 0, 1, 2 ], [ 0, 1 ] ⱶ[ 2, 2 ]→ [ 0, 1, 2 ] ]

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> L = FinSet( 0 )
|0|

julia> M = FinSet( 2 )
|2|

julia> Display( ExactCoverWithGlobalElements( L ) )
[  ]

julia> g = ExactCoverWithGlobalElements( M );

julia> Display( g )
[ [ 0 ] ⱶ[ 0 ]→ [ 0, 1 ], [ 0 ] ⱶ[ 1 ]→ [ 0, 1 ] ]

julia> IsOne( UniversalMorphismFromCoproduct( g ) )
true

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> S = FinSet( [ 1, 2, 3 ] )
<An object in FinSets>

julia> T = FinSet( [ "a", "b" ] )
<An object in FinSets>

julia> phi = [ [ 1, "b" ], [ 2, "a" ], [ 3, "b" ] ];

julia> phi = MapOfFinSets( S, phi, T )
<A morphism in FinSets>

julia> psi = [ [ "a", 3 ], [ "b", 1 ] ];

julia> psi = MapOfFinSets( T, psi, S )
<A morphism in FinSets>

julia> alpha = PreCompose( phi, psi )
<A morphism in FinSets>

julia> Display( List( S, alpha ) )
[ 1, 3, 1 ]

julia> IsOne( alpha )
false

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> S = FinSet( [ 1, 2, 3 ] )
<An object in FinSets>

julia> T = S
<An object in FinSets>

julia> phi = [ [ 1, 2 ], [ 2, 3 ], [ 3, 1 ] ];

julia> phi = MapOfFinSets( S, phi, T )
<A morphism in FinSets>

julia> I = ImageObject( phi )
<An object in FinSets>

julia> Length( I )
3

julia> IsMonomorphism( phi )
true

julia> IsSplitMonomorphism( phi )
true

julia> IsEpimorphism( phi )
true

julia> IsSplitEpimorphism( phi )
true

julia> iota = ImageEmbedding( phi )
<A morphism in FinSets>

julia> pi = CoastrictionToImage( phi )
<A morphism in FinSets>

julia> PreCompose( pi, iota ) == phi
true

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> M = FinSet( [ 1, 2, 3 ] )
<An object in FinSets>

julia> IsInitial( M )
false

julia> IsTerminal( M )
false

julia> I = InitialObject( FinSets )
<An object in FinSets>

julia> IsInitial( I )
true

julia> IsTerminal( I )
false

julia> iota = UniversalMorphismFromInitialObject( M )
<A morphism in FinSets>

julia> Display( I )
[ ]

julia> T = TerminalObject( FinSets )
<An object in FinSets>

julia> Display( T )
[ [ ] ]

julia> IsInitial( T )
false

julia> IsTerminal( T )
true

julia> pi = UniversalMorphismIntoTerminalObject( M )
<A morphism in FinSets>

julia> IsIdenticalObj( Range( pi ), T )
true

julia> t = FinSet( [ "Julia" ] )
<An object in FinSets>

julia> pi_t = UniversalMorphismIntoTerminalObjectWithGivenTerminalObject( M, t )
<A morphism in FinSets>

julia> Display( List( M, pi_t ) )
[ "Julia", "Julia", "Julia" ]

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> I = FinSet( [ ] )
<An object in FinSets>

julia> T = FinSet( [ 1 ] )
<An object in FinSets>

julia> M = FinSet( [ 2 ] )
<An object in FinSets>

julia> IsProjective( I )
true

julia> IsProjective( T )
true

julia> IsProjective( M )
true

julia> IsOne( EpimorphismFromSomeProjectiveObject( I ) )
true

julia> IsOne( EpimorphismFromSomeProjectiveObject( M ) )
true

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> I = FinSet( [ ] )
<An object in FinSets>

julia> T = FinSet( [ 1 ] )
<An object in FinSets>

julia> M = FinSet( [ 2 ] )
<An object in FinSets>

julia> IsInjective( I )
false

julia> IsInjective( T )
true

julia> IsInjective( M )
true

julia> IsIsomorphism( MonomorphismIntoSomeInjectiveObject( I ) )
false

julia> IsMonomorphism( MonomorphismIntoSomeInjectiveObject( I ) )
true

julia> IsOne( MonomorphismIntoSomeInjectiveObject( M ) )
true

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> S = FinSet( [ 1, 2, 3 ] )
<An object in FinSets>

julia> Length( S )
3

julia> T = FinSet( [ "a", "b" ] )
<An object in FinSets>

julia> Length( T )
2

julia> P = DirectProduct( S, T )
<An object in FinSets>

julia> Length( P )
6

julia> Display( P )
[ [ 1, "a" ], [ 2, "a" ], [ 3, "a" ], [ 1, "b" ], [ 2, "b" ], [ 3, "b" ] ]

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> S = FinSet( [ 1, 2, 3 ] )
<An object in FinSets>

julia> Length( S )
3

julia> T = FinSet( [ "a", "b" ] )
<An object in FinSets>

julia> Length( T )
2

julia> C = Coproduct( T, S )
<An object in FinSets>

julia> Length( C )
5

julia> Display( C )
[ [ 1, "a" ], [ 1, "b" ], [ 2, 1 ], [ 2, 2 ], [ 2, 3 ] ]

julia> M = FinSet( [ 1, 2, 3, 4, 5, 6, 7 ] )
<An object in FinSets>

julia> N = FinSet( [ 1, 2, 3 ] )
<An object in FinSets>

julia> P = FinSet( [ 1, 2, 3, 4 ] )
<An object in FinSets>

julia> C = Coproduct( M, N, P )
<An object in FinSets>

julia> Display( AsList( C ) )
[ [ 1, 1 ], [ 1, 2 ], [ 1, 3 ], [ 1, 4 ], [ 1, 5 ], [ 1, 6 ], [ 1, 7 ], [ 2, 1 ], [ 2, 2 ], [ 2, 3 ], [ 3, 1 ], [ 3, 2 ], [ 3, 3 ], [ 3, 4 ] ]

julia> iota1 = InjectionOfCofactorOfCoproduct( [ M, N, P ], 1 )
<A morphism in FinSets>

julia> IsWellDefined( iota1 )
true

julia> Display( AsList( iota1 ) )
[ [ 1, [ 1, 1 ] ], [ 2, [ 1, 2 ] ], [ 3, [ 1, 3 ] ], [ 4, [ 1, 4 ] ], [ 5, [ 1, 5 ] ], [ 6, [ 1, 6 ] ], [ 7, [ 1, 7 ] ] ]

julia> iota2 = InjectionOfCofactorOfCoproduct( [ M, N, P ], 2 )
<A morphism in FinSets>

julia> IsWellDefined( iota2 )
true

julia> Display( AsList( iota2 ) )
[ [ 1, [ 2, 1 ] ], [ 2, [ 2, 2 ] ], [ 3, [ 2, 3 ] ] ]

julia> iota3 = InjectionOfCofactorOfCoproduct( [ M, N, P ], 3 )
<A morphism in FinSets>

julia> IsWellDefined( iota3 )
true

julia> Display( AsList( iota3 ) )
[ [ 1, [ 3, 1 ] ], [ 2, [ 3, 2 ] ], [ 3, [ 3, 3 ] ], [ 4, [ 3, 4 ] ] ]

julia> psi = UniversalMorphismFromCoproduct( [ M, N, P ],
                                               [ iota1, iota2, iota3 ]
                                             )
<A morphism in FinSets>

julia> psi == IdentityMorphism( Coproduct( [ M, N, P ] ) )
true

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> S = FinSet( [ 1, 2, 3 ] )
<An object in FinSets>

julia> T = FinSet( [ "a", "b", "c" ] )
<An object in FinSets>

julia> phi = [ [ 1, "b" ], [ 2, "a" ], [ 3, "b" ] ];

julia> phi = MapOfFinSets( S, phi, T )
<A morphism in FinSets>

julia> I = ImageObject( phi )
<An object in FinSets>

julia> Length( I )
2

julia> IsMonomorphism( phi )
false

julia> IsSplitMonomorphism( phi )
false

julia> IsEpimorphism( phi )
false

julia> IsSplitEpimorphism( phi )
false

julia> iota = ImageEmbedding( phi )
<A morphism in FinSets>

julia> pi = CoastrictionToImage( phi )
<A morphism in FinSets>

julia> PreCompose( pi, iota ) == phi
true

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> S = FinSet( [ 1, 2, 3 ] )
<An object in FinSets>

julia> T = FinSet( [ "a", "b", "c" ] )
<An object in FinSets>

julia> phi = [ [ 1, "b" ], [ 2, "a" ], [ 3, "b" ] ];

julia> phi = MapOfFinSets( S, phi, T )
<A morphism in FinSets>

julia> I = CoimageObject( phi )
<An object in FinSets>

julia> Length( I )
2

julia> IsMonomorphism( phi )
false

julia> IsSplitMonomorphism( phi )
false

julia> IsEpimorphism( phi )
false

julia> IsSplitEpimorphism( phi )
false

julia> iota = AstrictionToCoimage( phi )
<A morphism in FinSets>

julia> pi = CoimageProjection( phi )
<A morphism in FinSets>

julia> PreCompose( pi, iota ) == phi
true

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> S = FinSet( (1):(5) )
<An object in FinSets>

julia> T = FinSet( (1):(3) )
<An object in FinSets>

julia> f1 = MapOfFinSets( S, [ [1,3],[2,3],[3,1],[4,2],[5,2] ], T )
<A morphism in FinSets>

julia> f2 = MapOfFinSets( S, [ [1,3],[2,2],[3,3],[4,1],[5,2] ], T )
<A morphism in FinSets>

julia> f3 = MapOfFinSets( S, [ [1,3],[2,1],[3,2],[4,1],[5,2] ], T )
<A morphism in FinSets>

julia> D = [ f1, f2, f3 ];

julia> Eq = Equalizer( D )
<An object in FinSets>

julia> Display( Eq )
[ 1, 5 ]

julia> iota = EmbeddingOfEqualizer( D );

julia> IsWellDefined( iota )
true

julia> Im = ImageObject( iota )
<An object in FinSets>

julia> Display( Im )
[ 1, 5 ]

julia> mu = MorphismFromEqualizerToSink( D );

julia> PreCompose( iota, f1 ) == mu
true

julia> M = FinSet( [ "a" ] );

julia> phi = MapOfFinSets( M, [ [ "a", 5 ] ], S );

julia> IsWellDefined( phi )
true

julia> psi = UniversalMorphismIntoEqualizer( D, phi )
<A morphism in FinSets>

julia> IsWellDefined( psi )
true

julia> Display( psi )
[ [ "a" ], [ [ "a", 5 ] ], [ 1, 5 ] ]

julia> PreCompose( psi, iota ) == phi
true

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> M = FinSet( (1):(5) )
<An object in FinSets>

julia> N1 = FinSet( (1):(3) )
<An object in FinSets>

julia> iota1 = EmbeddingOfFinSets( N1, M )
<A morphism in FinSets>

julia> N2 = FinSet( (2):(5) )
<An object in FinSets>

julia> iota2 = EmbeddingOfFinSets( N2, M )
<A morphism in FinSets>

julia> D = [ iota1, iota2 ];

julia> int = FiberProduct( D )
<An object in FinSets>

julia> Display( int )
[ [ 2, 2 ], [ 3, 3 ] ]

julia> pi1 = ProjectionInFactorOfFiberProduct( D, 1 )
<A morphism in FinSets>

julia> int1 = ImageObject( pi1 )
<An object in FinSets>

julia> Display( int1 )
[ 2, 3 ]

julia> pi2 = ProjectionInFactorOfFiberProduct( D, 2 )
<A morphism in FinSets>

julia> int2 = ImageObject( pi2 )
<An object in FinSets>

julia> Display( int2 )
[ 2, 3 ]

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

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

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> M = FinSet( (1):(5) )
<An object in FinSets>

julia> N1 = FinSet( [ 1, 2, 4 ] )
<An object in FinSets>

julia> iota1 = EmbeddingOfFinSets( N1, M )
<A morphism in FinSets>

julia> N2 = FinSet( [ 2, 3 ] )
<An object in FinSets>

julia> iota2 = EmbeddingOfFinSets( N2, M )
<A morphism in FinSets>

julia> D = [ iota1, iota2 ];

julia> int = FiberProduct( D )
<An object in FinSets>

julia> Display( int )
[ [ 2, 2 ] ]

julia> pi1 = ProjectionInFactorOfFiberProduct( D, 1 )
<A morphism in FinSets>

julia> pi2 = ProjectionInFactorOfFiberProduct( D, 2 )
<A morphism in FinSets>

julia> UU = Pushout( pi1, pi2 )
<An object in FinSets>

julia> Display( UU )
[ [ [ 1, 1 ] ], [ [ 1, 2 ], [ 2, 2 ] ], [ [ 1, 4 ] ], [ [ 2, 3 ] ] ]

julia> iota = UniversalMorphismFromPushout( [ pi1, pi2 ], [ iota1, iota2 ] )
<A morphism in FinSets>

julia> U = ImageObject( iota )
<An object in FinSets>

julia> Display( U )
[ 1, 2, 4, 3 ]

julia> UnionOfFinSets( FinSets, [ N1, N2 ] ) == U
true

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> S = FinSet( (1):(3) )
<An object in FinSets>

julia> R = FinSet( (1):(2) )
<An object in FinSets>

julia> f = MapOfFinSets( S, [ [1,2],[2,2],[3,1] ], R )
<A morphism in FinSets>

julia> IsWellDefined( f )
true

julia> T = TerminalObject( FinSets )
<An object in FinSets>

julia> IsTerminal( T )
true

julia> lf = CartesianLambdaIntroduction( f )
<A morphism in FinSets>

julia> Source( lf ) == T
true

julia> Length( Range( lf ) )
8

julia> lf( T[1] ) == f
true

julia> elf = CartesianLambdaElimination( S, R, lf )
<A morphism in FinSets>

julia> elf == f
true

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> m = FinSet( (1):(3) )
<An object in FinSets>

julia> n = FinSet( (1):(4) )
<An object in FinSets>

julia> f = MapOfFinSets( m, [ [ 1, 2 ], [ 2, 2 ], [ 3, 1 ] ], m )
<A morphism in FinSets>

julia> g = MapOfFinSets( n, [ [ 1, 3 ], [ 2, 2 ], [ 3, 1 ], [ 4, 2 ] ], m )
<A morphism in FinSets>

julia> IsLiftable( f, g )
true

julia> chi = Lift( f, g )
<A morphism in FinSets>

julia> Display( chi )
[ [ 1 .. 3 ], [ [ 1, 2 ], [ 2, 2 ], [ 3, 3 ] ], [ 1 .. 4 ] ]

julia> PreCompose( Lift( f, g ), g ) == f
true

julia> IsLiftable( g, f )
false

julia> k = FinSet( (1):(100) )
<An object in FinSets>

julia> h = ListWithIdenticalEntries( Length( k ) - 3, 3 );

julia> h = @Concatenation( h, [ 2, 1, 2 ] );

julia> h = MapOfFinSets( k, List( k, i -> [ i, h[i] ] ), m )
<A morphism in FinSets>

julia> IsLiftable( f, h )
true

julia> IsLiftable( h, f )
false

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> M = FinSet( (1):(5) );

julia> N = FinSet( [ 1, 2, 4 ] );

julia> P = FinSet( [ 1, 4, 8, 9 ] );

julia> G_f = [ [ 1, 1 ], [ 2, 2 ], [ 3, 1 ], [ 4, 2 ], [ 5, 4 ] ];

julia> f = MapOfFinSets( M, G_f, N );

julia> IsWellDefined( f )
true

julia> G_g = [ [ 1, 4 ], [ 2, 4 ], [ 3, 2 ], [ 4, 2 ], [ 5, 1 ] ];

julia> g = MapOfFinSets( M, G_g, N );

julia> IsWellDefined( g )
true

julia> DirectProduct( M, N );

julia> DirectProductOnMorphisms( f, g );

julia> CartesianAssociatorLeftToRight( M, N, P );

julia> CartesianAssociatorRightToLeft( M, N, P );

julia> TerminalObject( FinSets );

julia> CartesianLeftUnitor( M );

julia> CartesianLeftUnitorInverse( M );

julia> CartesianRightUnitor( M );

julia> CartesianRightUnitorInverse( M );

julia> CartesianBraiding( M, N );

julia> CartesianBraidingInverse( M, N );

julia> exp = ExponentialOnObjects( M, N );

julia> ExponentialOnObjects( FinSet( [ 1 ] ), exp );

julia> ExponentialOnMorphisms( f, g );

julia> CartesianEvaluationMorphism( M, N );

julia> CartesianCoevaluationMorphism( M, N );

julia> DirectProductToExponentialAdjunctionMap( M, N,
            UniversalMorphismIntoTerminalObject( DirectProduct( M, N ) )
        );

julia> ExponentialToDirectProductAdjunctionMap( M, N,
            UniversalMorphismFromInitialObject( ExponentialOnObjects( M, N ) )
        );

julia> M = FinSet( [ 1, 2 ] );

julia> N = FinSet( [ "a", "b" ] );

julia> P = FinSet( [ "*" ] );

julia> Q = FinSet( [ "§", "&" ] );

julia> CartesianPreComposeMorphism( M, N, P );

julia> CartesianPostComposeMorphism( M, N, P );

julia> DirectProductExponentialCompatibilityMorphism( [ M, N, P, Q ] );

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> Display( SubobjectClassifier( FinSets ) )
[ "true", "false" ]

julia> Display( TruthMorphismOfTrue( FinSets ) )
[ [ [ ] ], [ [ [ ], "true" ] ], [ "true", "false" ] ]

julia> Display( TruthMorphismOfFalse( FinSets ) )
[ [ [ ] ], [ [ [ ], "false" ] ], [ "true", "false" ] ]

julia> Display( TruthMorphismOfNot( FinSets ) )
[ [ "true", "false" ], [ [ "false", "true" ], [ "true", "false" ] ], [ "true", "false" ] ]

julia> Display( CartesianSquareOfSubobjectClassifier( FinSets ) )
[ [ "true", "true" ], [ "false", "true" ], [ "true", "false" ], [ "false", "false" ] ]

julia> Display( TruthMorphismOfAnd( FinSets ) )
[ [ [ "true", "true" ], [ "false", "true" ], [ "true", "false" ], [ "false", "false" ] ], [ [ [ "false", "false" ], "false" ], [ [ "false", "true" ], "false" ], [ [ "true", "false" ], "false" ], [ [ "true", "true" ], "true" ] ], [ "true", "false" ] ]

julia> Display( TruthMorphismOfOr( FinSets ) )
[ [ [ "true", "true" ], [ "false", "true" ], [ "true", "false" ], [ "false", "false" ] ], [ [ [ "false", "false" ], "false" ], [ [ "false", "true" ], "true" ], [ [ "true", "false" ], "true" ], [ [ "true", "true" ], "true" ] ], [ "true", "false" ] ]

julia> Display( TruthMorphismOfImplies( FinSets ) )
[ [ [ "true", "true" ], [ "false", "true" ], [ "true", "false" ], [ "false", "false" ] ], [ [ [ "false", "false" ], "true" ], [ [ "false", "true" ], "true" ], [ [ "true", "false" ], "false" ], [ [ "true", "true" ], "true" ] ], [ "true", "false" ] ]

julia> S = FinSet( [ 1, 2, 3, 4, 5 ] )
<An object in FinSets>

julia> A = FinSet( [ 1, 5 ] )
<An object in FinSets>

julia> m = EmbeddingOfFinSets( A, S )
<A morphism in FinSets>

julia> Display( ClassifyingMorphismOfSubobject( m ) )
[ [ 1, 2, 3, 4, 5 ], [ [ 1, "true" ], [ 2, "false" ], [ 3, "false" ], [ 4, "false" ], [ 5, "true" ] ], [ "true", "false" ] ]

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> M = FinSet( (1):(7) )
<An object in FinSets>

julia> N = FinSet( [ 2, 3, 5 ] )
<An object in FinSets>

julia> iotaN = EmbeddingOfFinSets( N, M )
<A morphism in FinSets>

julia> NC = PseudoComplementSubobject( iotaN )
<An object in FinSets>

julia> Display( NC )
[ [ 1, [ ] ], [ 4, [ ] ], [ 6, [ ] ], [ 7, [ ] ] ]

julia> tauN = EmbeddingOfPseudoComplementSubobject( iotaN )
<A morphism in FinSets>

julia> Nc = ImageObject( tauN )
<An object in FinSets>

julia> Display( Nc )
[ 1, 4, 6, 7 ]

julia> L = FinSet( [ 2, 4, 5, 7 ] )
<An object in FinSets>

julia> iotaL = EmbeddingOfFinSets( L, M )
<A morphism in FinSets>

julia> NIL = IntersectionSubobject( iotaN, iotaL )
<An object in FinSets>

julia> Display( NIL )
[ [ 2, 2 ], [ 5, 5 ] ]

julia> iotaNiL = EmbeddingOfIntersectionSubobject( iotaN, iotaL )
<A morphism in FinSets>

julia> NiL = ImageObject( iotaNiL )
<An object in FinSets>

julia> Display( NiL )
[ 2, 5 ]

julia> NUL = UnionSubobject( iotaN, iotaL )
<An object in FinSets>

julia> Display( NUL )
[ 2, 3, 5, 4, 7 ]

julia> iotaNuL = EmbeddingOfUnionSubobject( iotaN, iotaL )
<A morphism in FinSets>

julia> NuL = ImageObject( iotaNuL )
<An object in FinSets>

julia> Display( NuL )
[ 2, 3, 5, 4, 7 ]

julia> NPL = RelativePseudoComplementSubobject( iotaN, iotaL )
<An object in FinSets>

julia> Display( NPL )
[ [ 1, [ ] ], [ 2, [ ] ], [ 4, [ ] ], [ 5, [ ] ], [ 6, [ ] ], [ 7, [ ] ] ]

julia> iotaNpL = EmbeddingOfRelativePseudoComplementSubobject( iotaN, iotaL )
<A morphism in FinSets>

julia> NpL = ImageObject( iotaNpL )
<An object in FinSets>

julia> Display( NpL )
[ 1, 2, 4, 5, 6, 7 ]

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> K = FinSet( [ 2, 3, 5 ] );

julia> Display( K )
[ 2, 3, 5 ]

julia> L = FinSet( [ 0, 1, 2, 3, 5, 6 ] );

julia> Display( L )
[ 0, 1, 2, 3, 5, 6 ]

julia> l = EmbeddingOfFinSets( K, L )
<A morphism in FinSets>

julia> G = FinSet( [ 0, 1, 2, 3, 4, 5, 6, 10 ] );

julia> Display( G )
[ 0, 1, 2, 3, 4, 5, 6, 10 ]

julia> m = EmbeddingOfFinSets( L, G )
<A morphism in FinSets>

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> HasPushoutComplement( l, m )
true

julia> c = PushoutComplement( l, m )
<A morphism in FinSets>

julia> D = Source( c );

julia> Display( D )
[ 2, 3, 4, 5, 10 ]

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> m = FinSet( 7 )
|7|

julia> Display( m )
[ 0,..., 6 ]

julia> IsWellDefined( m )
true

julia> StringGAP( m )
"FinSet( SkeletalFinSets, 7 )"

julia> Display( List( m, x -> x^2 ) )
[ 0, 1, 4, 9, 16, 25, 36 ]

julia> L = ObjectDatum( m )
7

julia> mm = ObjectConstructor( SkeletalFinSets, BigInt( 7 ) )
|7|

julia> m == mm
true

julia> n = FinSet( -2 )
|-2|

julia> IsWellDefined( n )
false

julia> n = FinSet( 3 )
|3|

julia> IsWellDefined( n )
true

julia> p = FinSet( 4 )
|4|

julia> IsWellDefined( p )
true

julia> IsEqualForObjects( m, n )
false

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> s = FinSet( 3 )
|3|

julia> t = FinSet( 7 )
|7|

julia> phi = MapOfFinSets( s, [ 6, 4, 4 ], t )
|3| → |7|

julia> Display( AsList( phi ) )
[ 6, 4, 4 ]

julia> IsWellDefined( phi )
true

julia> Display( phi )
[ 0, 1, 2 ] ⱶ[ 6, 4, 4 ]→ [ 0,..., 6 ]

julia> StringGAP( phi )
"MapOfFinSets( SkeletalFinSets, FinSet( SkeletalFinSets, 3 ), [ 6, 4, 4 ], FinSet( SkeletalFinSets, 7 ) )"

julia> s = ObjectConstructor( SkeletalFinSets, BigInt( 3 ) )
|3|

julia> t = ObjectConstructor( SkeletalFinSets, BigInt( 7 ) )
|7|

julia> phi = MorphismConstructor(
            s,
            [ BigInt( 6 ), BigInt( 4 ), BigInt( 4 ) ],
            t
        )
|3| → |7|

julia> Display( MorphismDatum( phi ) )
[ 6, 4, 4 ]

julia> IsWellDefined( phi )
true

julia> Display( phi )
[ 0, 1, 2 ] ⱶ[ 6, 4, 4 ]→ [ 0,..., 6 ]

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> L = FinSet( 0 )
|0|

julia> M = FinSet( 2 )
|2|

julia> N = FinSet( 3 )
|3|

julia> IsHomSetInhabited( L, L )
true

julia> IsHomSetInhabited( M, L )
false

julia> IsHomSetInhabited( L, M )
true

julia> IsHomSetInhabited( M, N )
true

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> s = FinSet( 7 )
|7|

julia> t = FinSet( 4 )
|4|

julia> psi = MapOfFinSets( s, [ 0, 2, 1, 2, 1, 3 ], t )
|7| → |4|

julia> IsWellDefined( psi )
false

julia> psi = MapOfFinSets( s, [ 0, 2, 1, 2, 1, 3, -2 ], t )
|7| → |4|

julia> IsWellDefined( psi )
false

julia> psi = MapOfFinSets( s, [ 1, 2, 1, 4, 2, 1, 3 ], t )
|7| → |4|

julia> IsWellDefined( psi )
false

julia> psi = MapOfFinSets( s, [ 0, 2, 1, 3, 2, 1, 3 ], t )
|7| → |4|

julia> IsWellDefined( psi )
true

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> m = FinSet( 3 )
|3|

julia> n = FinSet( 5 )
|5|

julia> p = FinSet( 7 )
|7|

julia> psi = MapOfFinSets( m, [ 1, 4, 2 ], n )
|3| → |5|

julia> phi = MapOfFinSets( n, [ 0, 3, 5, 5, 2 ], p )
|5| → |7|

julia> alpha = PreCompose( psi, phi )
|3| → |7|

julia> Display( alpha )
[ 0, 1, 2 ] ⱶ[ 3, 2, 5 ]→ [ 0,..., 6 ]

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> m = FinSet( 3 )
|3|

julia> n = FinSet( 5 )
|5|

julia> p = FinSet( 7 )
|7|

julia> psi = MapOfFinSets( m, [ 0, 2, 4 ], n )
|3| → |5|

julia> IsEpimorphism( psi )
false

julia> IsSplitEpimorphism( psi )
false

julia> IsMonomorphism( psi )
true

julia> IsSplitMonomorphism( psi )
true

julia> psi
|3| ↪ |5|

julia> psi = MapOfFinSets( p, [ 0, 2, 1, 2, 2, 1, 0 ], m )
|7| → |3|

julia> IsEpimorphism( psi )
true

julia> IsSplitEpimorphism( psi )
true

julia> IsMonomorphism( psi )
false

julia> IsSplitMonomorphism( psi )
false

julia> psi
|7| ↠ |3|

julia> id = IdentityMorphism( m )
|3| → |3|

julia> IsIsomorphism( id )
true

julia> id
|3| ⭇ |3|

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> m = FinSet( 8 )
|8|

julia> IsInitial( m )
false

julia> IsTerminal( m )
false

julia> i = InitialObject( SkeletalFinSets )
|0|

julia> Display( i )
∅

julia> IsInitial( i )
true

julia> IsTerminal( i )
false

julia> iota = UniversalMorphismFromInitialObject( m )
|0| → |8|

julia> Display( AsList( i ) )
[  ]

julia> t = TerminalObject( SkeletalFinSets )
|1|

julia> Display( AsList( t ) )
[ 0 ]

julia> IsInitial( t )
false

julia> IsTerminal( t )
true

julia> pi = UniversalMorphismIntoTerminalObject( m )
|8| → |1|

julia> IsIdenticalObj( Range( pi ), t )
true

julia> pi_t = UniversalMorphismIntoTerminalObjectWithGivenTerminalObject( m, t )
|8| → |1|

julia> Display( AsList( pi_t ) )
[ 0, 0, 0, 0, 0, 0, 0, 0 ]

julia> pi == pi_t
true

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> I = FinSet( 0 )
|0|

julia> T = FinSet( 1 )
|1|

julia> M = FinSet( 2 )
|2|

julia> IsProjective( I )
true

julia> IsProjective( T )
true

julia> IsProjective( M )
true

julia> IsOne( EpimorphismFromSomeProjectiveObject( I ) )
true

julia> IsOne( EpimorphismFromSomeProjectiveObject( M ) )
true

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> I = FinSet( 0 )
|0|

julia> T = FinSet( 1 )
|1|

julia> M = FinSet( 2 )
|2|

julia> IsInjective( I )
false

julia> IsInjective( T )
true

julia> IsInjective( M )
true

julia> IsIsomorphism( MonomorphismIntoSomeInjectiveObject( I ) )
false

julia> IsMonomorphism( MonomorphismIntoSomeInjectiveObject( I ) )
true

julia> IsOne( MonomorphismIntoSomeInjectiveObject( M ) )
true

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> m = FinSet( 7 )
|7|

julia> n = FinSet( 3 )
|3|

julia> p = FinSet( 4 )
|4|

julia> d = DirectProduct( [ m, n, p ] )
|84|

julia> Display( AsList( d ) )
[ 0 .. 83 ]

julia> pi1 = ProjectionInFactorOfDirectProduct( [ m, n, p ], 1 )
|84| → |7|

julia> Display( pi1 )
[ 0,..., 83 ] ⱶ[ 0, 1, 2, 3, 4, 5, 6, 0, 1, 2, 3, 4, 5, 6, 0, 1, 2, 3, 4, 5, 6, 0, 1, 2, 3, 4, 5, 6, 0, 1, 2, 3, 4, 5, 6, 0, 1, 2, 3, 4, 5, 6, 0, 1, 2, 3, 4, 5, 6, 0, 1, 2, 3, 4, 5, 6, 0, 1, 2, 3, 4, 5, 6, 0, 1, 2, 3, 4, 5, 6, 0, 1, 2, 3, 4, 5, 6, 0, 1, 2, 3, 4, 5, 6 ]→ [ 0,..., 6 ]

julia> pi2 = ProjectionInFactorOfDirectProduct( [ m, n, p ], 2 )
|84| → |3|

julia> Display( pi2 )
[ 0,..., 83 ] ⱶ[ 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2 ]→ [ 0, 1, 2 ]

julia> pi3 = ProjectionInFactorOfDirectProduct( [ m, n, p ], 3 )
|84| → |4|

julia> Display( pi3 )
[ 0,..., 83 ] ⱶ[ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3 ]→ [ 0,..., 3 ]

julia> psi = UniversalMorphismIntoDirectProduct( [ m, n, p ], [ pi1, pi2, pi3 ] )
|84| → |84|

julia> psi == IdentityMorphism( d )
true

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> m = FinSet( 7 )
|7|

julia> n = FinSet( 3 )
|3|

julia> p = FinSet( 4 )
|4|

julia> c = Coproduct( m, n, p )
|14|

julia> Display( AsList( c ) )
[ 0 .. 13 ]

julia> iota1 = InjectionOfCofactorOfCoproduct( [ m, n, p ], 1 )
|7| → |14|

julia> IsWellDefined( iota1 )
true

julia> Display( iota1 )
[ 0,..., 6 ] ⱶ[ 0 .. 6 ]→ [ 0,..., 13 ]

julia> iota2 = InjectionOfCofactorOfCoproduct( [ m, n, p ], 2 )
|3| → |14|

julia> IsWellDefined( iota2 )
true

julia> Display( iota2 )
[ 0, 1, 2 ] ⱶ[ 7 .. 9 ]→ [ 0,..., 13 ]

julia> iota3 = InjectionOfCofactorOfCoproduct( [ m, n, p ], 3 )
|4| → |14|

julia> IsWellDefined( iota3 )
true

julia> Display( iota3 )
[ 0,..., 3 ] ⱶ[ 10 .. 13 ]→ [ 0,..., 13 ]

julia> psi = UniversalMorphismFromCoproduct(
                       [ m, n, p ], [ iota1, iota2, iota3 ] )
|14| → |14|

julia> id = IdentityMorphism( Coproduct( [ m, n, p ] ) )
|14| → |14|

julia> psi == id
true

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> m = FinSet( 7 )
|7|

julia> n = FinSet( 3 )
|3|

julia> phi = MapOfFinSets( n, [ 6, 4, 4 ], m )
|3| → |7|

julia> IsWellDefined( phi )
true

julia> ImageObject( phi )
|2|

julia> Length( ImageObject( phi ) )
2

julia> s = FinSet( 2 )
|2|

julia> I = ImageObject( phi, s )
|2|

julia> Length( I )
2

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> m = FinSet( 7 )
|7|

julia> n = FinSet( 3 )
|3|

julia> phi = MapOfFinSets( n, [ 6, 4, 4 ], m )
|3| → |7|

julia> pi = ImageEmbedding( phi )
|2| → |7|

julia> Display( pi )
[ 0, 1 ] ⱶ[ 4, 6 ]→ [ 0,..., 6 ]

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> m = FinSet( 7 )
|7|

julia> n = FinSet( 3 )
|3|

julia> phi = MapOfFinSets( n, [ 6, 4, 4 ], m )
|3| → |7|

julia> IsWellDefined( phi )
true

julia> f = CoastrictionToImage( phi )
|3| → |2|

julia> Display( f )
[ 0, 1, 2 ] ⱶ[ 1, 0, 0 ]→ [ 0, 1 ]

julia> IsWellDefined( f )
true

julia> IsEpimorphism( f )
true

julia> IsSplitEpimorphism( f )
true

julia> m = FinSet( 77 )
|77|

julia> n = FinSet( 4 )
|4|

julia> phi = MapOfFinSets( n, [ 76, 1, 24, 1 ], m )
|4| → |77|

julia> IsWellDefined( phi )
true

julia> iota = ImageEmbedding( phi )
|3| → |77|

julia> pi = CoastrictionToImage( phi )
|4| → |3|

julia> Display( pi )
[ 0,..., 3 ] ⱶ[ 2, 0, 1, 0 ]→ [ 0, 1, 2 ]

julia> IsWellDefined( pi )
true

julia> IsEpimorphism( pi )
true

julia> IsSplitEpimorphism( pi )
true

julia> PreCompose( pi, iota ) == phi
true

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> m = FinSet( 7 )
|7|

julia> n = FinSet( 3 )
|3|

julia> phi = MapOfFinSets( n, [ 6, 4, 4 ], m )
|3| → |7|

julia> P = Preimage( phi, [ 2 ] );

julia> Display( P )
[  ]

julia> P = Preimage( phi, AsList( FinSet( 5 ) ) );

julia> Display( P )
[ 1, 2 ]

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

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

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> m = FinSet( 5 )
|5|

julia> n1 = FinSet( 3 )
|3|

julia> iota1 = EmbeddingOfFinSets( n1, m )
|3| ↪ |5|

julia> Display( iota1 )
[ 0, 1, 2 ] ⱶ[ 0 .. 2 ]→ [ 0,..., 4 ]

julia> n2 = FinSet( 4 )
|4|

julia> iota2 = EmbeddingOfFinSets( n2, m )
|4| ↪ |5|

julia> Display( iota2 )
[ 0,..., 3 ] ⱶ[ 0 .. 3 ]→ [ 0,..., 4 ]

julia> D = [ iota1, iota2 ];

julia> Fib = FiberProduct( D )
|3|

julia> pi1 = ProjectionInFactorOfFiberProduct( D, 1 )
|3| → |3|

julia> Display( pi1 )
[ 0, 1, 2 ] ⱶ[ 0, 1, 2 ]→ [ 0, 1, 2 ]

julia> int1 = ImageObject( pi1 )
|3|

julia> pi2 = ProjectionInFactorOfFiberProduct( D, 2 )
|3| → |4|

julia> Display( pi2 )
[ 0, 1, 2 ] ⱶ[ 0, 1, 2 ]→ [ 0,..., 3 ]

julia> int2 = ImageObject( pi2 )
|3|

julia> omega1 = PreCompose( pi1, iota1 )
|3| → |5|

julia> omega2 = PreCompose( pi2, iota2 )
|3| → |5|

julia> omega1 == omega2
true

julia> Display( omega1 )
[ 0, 1, 2 ] ⱶ[ 0, 1, 2 ]→ [ 0,..., 4 ]

```

```jldoctest AutoDocTests
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

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> M = FinSet( 5 )
|5|

julia> N1 = FinSet( 3 )
|3|

julia> iota1 = EmbeddingOfFinSets( N1, M )
|3| ↪ |5|

julia> Display( iota1 )
[ 0, 1, 2 ] ⱶ[ 0 .. 2 ]→ [ 0,..., 4 ]

julia> N2 = FinSet( 2 )
|2|

julia> iota2 = EmbeddingOfFinSets( N2, M )
|2| ↪ |5|

julia> Display( iota2 )
[ 0, 1 ] ⱶ[ 0 .. 1 ]→ [ 0,..., 4 ]

julia> D = [ iota1, iota2 ];

julia> Fib = FiberProduct( D )
|2|

julia> pi1 = ProjectionInFactorOfFiberProduct( D, 1 )
|2| → |3|

julia> Display( pi1 )
[ 0, 1 ] ⱶ[ 0, 1 ]→ [ 0, 1, 2 ]

julia> pi2 = ProjectionInFactorOfFiberProduct( D, 2 )
|2| → |2|

julia> Display( pi2 )
[ 0, 1 ] ⱶ[ 0, 1 ]→ [ 0, 1 ]

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> D = [ pi1, pi2 ];

julia> UU = Pushout( D )
|3|

julia> kappa1 = InjectionOfCofactorOfPushout( D, 1 )
|3| → |3|

julia> Display( kappa1 )
[ 0, 1, 2 ] ⱶ[ 0, 1, 2 ]→ [ 0, 1, 2 ]

julia> kappa2 = InjectionOfCofactorOfPushout( D, 2 )
|2| → |3|

julia> Display( kappa2 )
[ 0, 1 ] ⱶ[ 0, 1 ]→ [ 0, 1, 2 ]

julia> PreCompose( pi1, kappa1 ) == PreCompose( pi2, kappa2 )
true

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> Co = Coproduct( N1, N2 )
|5|

julia> Display( Co )
[ 0,..., 4 ]

julia> iota_1 = InjectionOfCofactorOfCoproduct( [ N1, N2 ], 1 )
|3| → |5|

julia> Display( iota_1 )
[ 0, 1, 2 ] ⱶ[ 0 .. 2 ]→ [ 0,..., 4 ]

julia> iota_2 = InjectionOfCofactorOfCoproduct( [ N1, N2 ], 2 )
|2| → |5|

julia> Display( iota_2 )
[ 0, 1 ] ⱶ[ 3 .. 4 ]→ [ 0,..., 4 ]

julia> alpha = PreCompose( pi1, iota_1 )
|2| → |5|

julia> Display( alpha )
[ 0, 1 ] ⱶ[ 0, 1 ]→ [ 0,..., 4 ]

julia> beta = PreCompose( pi2, iota_2 )
|2| → |5|

julia> Display( beta )
[ 0, 1 ] ⱶ[ 3, 4 ]→ [ 0,..., 4 ]

julia> Cq = Coequalizer( [ alpha, beta ] )
|3|

julia> psi = ProjectionOntoCoequalizer( [ alpha, beta ] )
|5| → |3|

julia> Display( psi )
[ 0,..., 4 ] ⱶ[ 0, 1, 2, 0, 1 ]→ [ 0, 1, 2 ]

julia> Display( PreCompose( iota_1, psi ) )
[ 0, 1, 2 ] ⱶ[ 0, 1, 2 ]→ [ 0, 1, 2 ]

julia> Display( PreCompose( iota_2, psi ) )
[ 0, 1 ] ⱶ[ 0, 1 ]→ [ 0, 1, 2 ]

julia> PreCompose( alpha, psi ) == PreCompose( beta, psi )
true

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> S = FinSet( 3 )
|3|

julia> R = FinSet( 2 )
|2|

julia> f = MapOfFinSets( S, [ 1, 1, 0 ], R )
|3| → |2|

julia> IsWellDefined( f )
true

julia> T = TerminalObject( SkeletalFinSets )
|1|

julia> IsTerminal( T )
true

julia> IsOne( CartesianLambdaIntroduction( IdentityMorphism( T ) ) )
true

julia> lf = CartesianLambdaIntroduction( f )
|1| → |8|

julia> Source( lf ) == T
true

julia> Display( Range( lf ) )
[ 0,..., 7 ]

julia> Display( lf )
[ 0 ] ⱶ[ 3 ]→ [ 0,..., 7 ]

julia> elf = CartesianLambdaElimination( S, R, lf )
|3| → |2|

julia> elf == f
true

julia> L = MorphismsOfExternalHom( S, R );

julia> Display( L )
[ [ 0, 1, 2 ] ⱶ[ 0, 0, 0 ]→ [ 0, 1 ], [ 0, 1, 2 ] ⱶ[ 1, 0, 0 ]→ [ 0, 1 ], [ 0, 1, 2 ] ⱶ[ 0, 1, 0 ]→ [ 0, 1 ], [ 0, 1, 2 ] ⱶ[ 1, 1, 0 ]→ [ 0, 1 ], [ 0, 1, 2 ] ⱶ[ 0, 0, 1 ]→ [ 0, 1 ], [ 0, 1, 2 ] ⱶ[ 1, 0, 1 ]→ [ 0, 1 ], [ 0, 1, 2 ] ⱶ[ 0, 1, 1 ]→ [ 0, 1 ], [ 0, 1, 2 ] ⱶ[ 1, 1, 1 ]→ [ 0, 1 ] ]

julia> Li = List( L, phi -> CartesianLambdaIntroduction( phi ) );

julia> Display( Li )
[ [ 0 ] ⱶ[ 0 ]→ [ 0,..., 7 ], [ 0 ] ⱶ[ 1 ]→ [ 0,..., 7 ], [ 0 ] ⱶ[ 2 ]→ [ 0,..., 7 ], [ 0 ] ⱶ[ 3 ]→ [ 0,..., 7 ], [ 0 ] ⱶ[ 4 ]→ [ 0,..., 7 ], [ 0 ] ⱶ[ 5 ]→ [ 0,..., 7 ], [ 0 ] ⱶ[ 6 ]→ [ 0,..., 7 ], [ 0 ] ⱶ[ 7 ]→ [ 0,..., 7 ] ]

julia> L == List( Li, psi -> CartesianLambdaElimination( S, R, psi ) )
true

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> m = FinSet( 3 )
|3|

julia> n = FinSet( 4 )
|4|

julia> f = MapOfFinSets( m, [ 1, 1, 0 ], m )
|3| → |3|

julia> g = MapOfFinSets( n, [ 2, 1, 0, 1 ], m )
|4| → |3|

julia> IsLiftable( f, g )
true

julia> chi = Lift( f, g )
|3| → |4|

julia> Display( chi )
[ 0, 1, 2 ] ⱶ[ 1, 1, 2 ]→ [ 0,..., 3 ]

julia> PreCompose( Lift( f, g ), g ) == f
true

julia> IsLiftable( g, f )
false

julia> k = FinSet( 100000 )
|100000|

julia> h = ListWithIdenticalEntries( Length( k ) - 3, 2 );

julia> h = @Concatenation( h, [ 1, 0, 1 ] );

julia> h = MapOfFinSets( k, h, m )
|100000| → |3|

julia> IsLiftable( f, h )
true

julia> IsLiftable( h, f )
false

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> m = FinSet( 5 )
|5|

julia> n = FinSet( 4 )
|4|

julia> f = MapOfFinSets( m, [ 1, 1, 0, 0, 2 ], n )
|5| → |4|

julia> g = MapOfFinSets( m, [ 4, 4, 3, 3, 4 ], m )
|5| → |5|

julia> IsColiftable( f, g )
true

julia> chi = Colift( f, g )
|4| → |5|

julia> Display( chi )
[ 0,..., 3 ] ⱶ[ 3, 4, 4, 0 ]→ [ 0,..., 4 ]

julia> PreCompose( f, Colift( f, g ) ) == g
true

julia> IsColiftable( g, f )
false

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> T = TerminalObject( SkeletalFinSets );

julia> M = FinSet( 4 );

julia> N = FinSet( 3 );

julia> P = FinSet( 4 );

julia> G_f = [ 0, 1, 0, 2 ];

julia> f = MapOfFinSets( M, G_f, N );

julia> IsWellDefined( f )
true

julia> G_g = [ 2, 2, 1, 0 ];

julia> g = MapOfFinSets( M, G_g, N );

julia> IsWellDefined( g )
true

julia> DirectProduct( M, N );

julia> DirectProductOnMorphisms( f, g );

julia> CartesianAssociatorLeftToRight( M, N, P );

julia> CartesianAssociatorRightToLeft( M, N, P );

julia> TerminalObject( FinSets );

julia> CartesianLeftUnitor( M );

julia> CartesianLeftUnitorInverse( M );

julia> CartesianRightUnitor( M );

julia> CartesianRightUnitorInverse( M );

julia> CartesianBraiding( M, N );

julia> CartesianBraidingInverse( M, N );

julia> ExponentialOnObjects( M, N );

julia> ExponentialOnMorphisms( f, g );

julia> CartesianEvaluationMorphism( M, N );

julia> CartesianCoevaluationMorphism( M, N );

julia> CartesianCoevaluationMorphism( T, T );

julia> DirectProductToExponentialAdjunctionMap( M, N,
            UniversalMorphismIntoTerminalObject( DirectProduct( M, N ) )
        );

julia> ExponentialToDirectProductAdjunctionMap( M, N,
            UniversalMorphismFromInitialObject( ExponentialOnObjects( M, N ) )
        );

julia> M = FinSet( 2 );

julia> N = FinSet( 2 );

julia> P = FinSet( 1 );

julia> Q = FinSet( 2 );

julia> CartesianPreComposeMorphism( M, N, P );

julia> CartesianPostComposeMorphism( M, N, P );

julia> DirectProductExponentialCompatibilityMorphism( [ M, N, P, Q ] );

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> SubobjectClassifier( SkeletalFinSets )
|2|

julia> Display( TruthMorphismOfFalse( SkeletalFinSets ) )
[ 0 ] ⱶ[ 0 ]→ [ 0, 1 ]

julia> Display( TruthMorphismOfTrue( SkeletalFinSets ) )
[ 0 ] ⱶ[ 1 ]→ [ 0, 1 ]

julia> Display( TruthMorphismOfNot( SkeletalFinSets ) )
[ 0, 1 ] ⱶ[ 1, 0 ]→ [ 0, 1 ]

julia> CartesianSquareOfSubobjectClassifier( SkeletalFinSets )
|4|

julia> Display( TruthMorphismOfAnd( SkeletalFinSets ) )
[ 0,..., 3 ] ⱶ[ 0, 0, 0, 1 ]→ [ 0, 1 ]

julia> Display( TruthMorphismOfOr( SkeletalFinSets ) )
[ 0,..., 3 ] ⱶ[ 0, 1, 1, 1 ]→ [ 0, 1 ]

julia> Display( TruthMorphismOfImplies( SkeletalFinSets ) )
[ 0,..., 3 ] ⱶ[ 1, 0, 1, 1 ]→ [ 0, 1 ]

julia> S = FinSet( 5 )
|5|

julia> A = FinSet( 2 )
|2|

julia> m = MapOfFinSets( A, [ 0, 4 ], S )
|2| → |5|

julia> Display( ClassifyingMorphismOfSubobject( m ) )
[ 0,..., 4 ] ⱶ[ 1, 0, 0, 0, 1 ]→ [ 0, 1 ]

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> M = FinSet( 7 )
|7|

julia> N = FinSet( 3 )
|3|

julia> iotaN = MapOfFinSets( N, [ 1, 2, 4 ], M )
|3| → |7|

julia> NC = PseudoComplementSubobject( iotaN )
|4|

julia> tauN = EmbeddingOfPseudoComplementSubobject( iotaN )
|4| ↪ |7|

julia> Display( tauN )
[ 0,..., 3 ] ⱶ[ 0, 3, 5, 6 ]→ [ 0,..., 6 ]

julia> L = FinSet( 4 )
|4|

julia> iotaL = MapOfFinSets( L, [ 1, 3, 4, 6 ], M )
|4| → |7|

julia> NIL = IntersectionSubobject( iotaN, iotaL )
|2|

julia> iotaNiL = EmbeddingOfIntersectionSubobject( iotaN, iotaL )
|2| ↪ |7|

julia> Display( iotaNiL )
[ 0, 1 ] ⱶ[ 1, 4 ]→ [ 0,..., 6 ]

julia> NUL = UnionSubobject( iotaN, iotaL )
|5|

julia> iotaNuL = EmbeddingOfUnionSubobject( iotaN, iotaL )
|5| → |7|

julia> Display( iotaNuL )
[ 0,..., 4 ] ⱶ[ 1, 2, 3, 4, 6 ]→ [ 0,..., 6 ]

julia> NPL = RelativePseudoComplementSubobject( iotaN, iotaL )
|6|

julia> iotaNpL = EmbeddingOfRelativePseudoComplementSubobject( iotaN, iotaL )
|6| ↪ |7|

julia> Display( iotaNpL )
[ 0,..., 5 ] ⱶ[ 0, 1, 3, 4, 5, 6 ]→ [ 0,..., 6 ]

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> K = FinSet( 3 )
|3|

julia> L = FinSet( 6 )
|6|

julia> l = MapOfFinSets( K, [ 2, 3, 4 ], L );; IsMonomorphism( l );; l
|3| ↪ |6|

julia> Display( l )
[ 0, 1, 2 ] ⱶ[ 2, 3, 4 ]→ [ 0,..., 5 ]

julia> G = FinSet( 8 )
|8|

julia> Display( G )
[ 0,..., 7 ]

julia> m = MapOfFinSets( L, [ 0, 1, 2, 3, 5, 6 ], G )
|6| → |8|

julia> Display( m )
[ 0,..., 5 ] ⱶ[ 0, 1, 2, 3, 5, 6 ]→ [ 0,..., 7 ]

```

```jldoctest AutoDocTests
julia> using CAP; using CartesianCategories; using Toposes; using FinSetsForCAP

julia> true
true

julia> HasPushoutComplement( l, m )
true

julia> c = PushoutComplement( l, m )
|5| → |8|

julia> Display( c )
[ 0,..., 4 ] ⱶ[ 2, 3, 4, 5, 7 ]→ [ 0,..., 7 ]

```
