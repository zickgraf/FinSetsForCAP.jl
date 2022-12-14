# SPDX-License-Identifier: GPL-2.0-or-later
# FinSetsForCAP: The elementary topos of (skeletal) finite sets
#
# Declarations
#

#! @Chapter The category of skeletal finite sets

#! @Section Skeletal Tools

#! @Description
#!  Returns  (q^n-1)/(q-1)  == <C>Sum</C>( (0):(<A>n</A> - 1), i -> <A>q</A>^i ),
#!  taking the corner case <A>q</A> = 1  into account.
#! @Arguments q, n
#! @Returns an integer
@DeclareOperation( "GeometricSum",
        [ IsRingElement, IsInt ] );

CapJitAddTypeSignature( "GeometricSum", [ IsInt, IsInt ], IsInt );

#! @Description
#!  Returns  (1+((n-1)*q-n)*q^(n-1))/(q-1)^2  == <C>Sum</C>( (0):(<A>n</A> - 1), i -> i * <A>q</A>^(i - 1) ),
#!  taking the corner case <A>q</A> = 1  into account.
#! @Arguments q, n
#! @Returns an integer
@DeclareOperation( "GeometricSumDiff1",
        [ IsRingElement, IsInt ] );

CapJitAddTypeSignature( "GeometricSumDiff1", [ IsInt, IsInt ], IsInt );
