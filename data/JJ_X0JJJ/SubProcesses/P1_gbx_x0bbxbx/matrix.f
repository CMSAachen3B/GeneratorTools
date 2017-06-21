      SUBROUTINE SMATRIXHEL(P,HEL,ANS)
      IMPLICIT NONE
C     
C     CONSTANT
C     
      INTEGER    NEXTERNAL
      PARAMETER (NEXTERNAL=6)
      INTEGER                 NCOMB
      PARAMETER (             NCOMB=32)
CF2PY INTENT(OUT) :: ANS
CF2PY INTENT(IN) :: HEL
CF2PY INTENT(IN) :: P(0:3,NEXTERNAL)

C     
C     ARGUMENTS 
C     
      REAL*8 P(0:3,NEXTERNAL),ANS
      INTEGER HEL
C     
C     GLOBAL VARIABLES
C     
      INTEGER USERHEL
      COMMON/HELUSERCHOICE/USERHEL
C     ----------
C     BEGIN CODE
C     ----------
      USERHEL=HEL
      CALL SMATRIX(P,ANS)
      USERHEL=-1

      END

      SUBROUTINE SMATRIX(P,ANS)
C     
C     Generated by MadGraph5_aMC@NLO v. 2.5.2, 2016-12-10
C     By the MadGraph5_aMC@NLO Development Team
C     Visit launchpad.net/madgraph5 and amcatnlo.web.cern.ch
C     
C     MadGraph5_aMC@NLO StandAlone Version
C     
C     Returns amplitude squared summed/avg over colors
C     and helicities
C     for the point in phase space P(0:3,NEXTERNAL)
C     
C     Process: g b~ > x0 b b~ b~ QNP<=2 WEIGHTED<=5 @1
C     
      IMPLICIT NONE
C     
C     CONSTANTS
C     
      INTEGER    NEXTERNAL
      PARAMETER (NEXTERNAL=6)
      INTEGER    NINITIAL
      PARAMETER (NINITIAL=2)
      INTEGER NPOLENTRIES
      PARAMETER (NPOLENTRIES=(NEXTERNAL+1)*6)
      INTEGER                 NCOMB
      PARAMETER (             NCOMB=32)
      INTEGER HELAVGFACTOR
      PARAMETER (HELAVGFACTOR=4)
C     
C     ARGUMENTS 
C     
      REAL*8 P(0:3,NEXTERNAL),ANS
CF2PY INTENT(OUT) :: ANS
CF2PY INTENT(IN) :: P(0:3,NEXTERNAL)
C     
C     LOCAL VARIABLES 
C     
      INTEGER NHEL(NEXTERNAL,NCOMB),NTRY
      REAL*8 T
      REAL*8 MATRIX
      INTEGER IHEL,IDEN, I, J
C     For a 1>N process, them BEAMTWO_HELAVGFACTOR would be set to 1.
      INTEGER BEAMS_HELAVGFACTOR(2)
      DATA (BEAMS_HELAVGFACTOR(I),I=1,2)/2,2/
      INTEGER JC(NEXTERNAL)
      LOGICAL GOODHEL(NCOMB)
      DATA NTRY/0/
      DATA GOODHEL/NCOMB*.FALSE./

C     
C     GLOBAL VARIABLES
C     
      INTEGER USERHEL
      COMMON/HELUSERCHOICE/USERHEL
      DATA USERHEL/-1/

      DATA (NHEL(I,   1),I=1,6) /-1,-1, 0,-1, 1, 1/
      DATA (NHEL(I,   2),I=1,6) /-1,-1, 0,-1, 1,-1/
      DATA (NHEL(I,   3),I=1,6) /-1,-1, 0,-1,-1, 1/
      DATA (NHEL(I,   4),I=1,6) /-1,-1, 0,-1,-1,-1/
      DATA (NHEL(I,   5),I=1,6) /-1,-1, 0, 1, 1, 1/
      DATA (NHEL(I,   6),I=1,6) /-1,-1, 0, 1, 1,-1/
      DATA (NHEL(I,   7),I=1,6) /-1,-1, 0, 1,-1, 1/
      DATA (NHEL(I,   8),I=1,6) /-1,-1, 0, 1,-1,-1/
      DATA (NHEL(I,   9),I=1,6) /-1, 1, 0,-1, 1, 1/
      DATA (NHEL(I,  10),I=1,6) /-1, 1, 0,-1, 1,-1/
      DATA (NHEL(I,  11),I=1,6) /-1, 1, 0,-1,-1, 1/
      DATA (NHEL(I,  12),I=1,6) /-1, 1, 0,-1,-1,-1/
      DATA (NHEL(I,  13),I=1,6) /-1, 1, 0, 1, 1, 1/
      DATA (NHEL(I,  14),I=1,6) /-1, 1, 0, 1, 1,-1/
      DATA (NHEL(I,  15),I=1,6) /-1, 1, 0, 1,-1, 1/
      DATA (NHEL(I,  16),I=1,6) /-1, 1, 0, 1,-1,-1/
      DATA (NHEL(I,  17),I=1,6) / 1,-1, 0,-1, 1, 1/
      DATA (NHEL(I,  18),I=1,6) / 1,-1, 0,-1, 1,-1/
      DATA (NHEL(I,  19),I=1,6) / 1,-1, 0,-1,-1, 1/
      DATA (NHEL(I,  20),I=1,6) / 1,-1, 0,-1,-1,-1/
      DATA (NHEL(I,  21),I=1,6) / 1,-1, 0, 1, 1, 1/
      DATA (NHEL(I,  22),I=1,6) / 1,-1, 0, 1, 1,-1/
      DATA (NHEL(I,  23),I=1,6) / 1,-1, 0, 1,-1, 1/
      DATA (NHEL(I,  24),I=1,6) / 1,-1, 0, 1,-1,-1/
      DATA (NHEL(I,  25),I=1,6) / 1, 1, 0,-1, 1, 1/
      DATA (NHEL(I,  26),I=1,6) / 1, 1, 0,-1, 1,-1/
      DATA (NHEL(I,  27),I=1,6) / 1, 1, 0,-1,-1, 1/
      DATA (NHEL(I,  28),I=1,6) / 1, 1, 0,-1,-1,-1/
      DATA (NHEL(I,  29),I=1,6) / 1, 1, 0, 1, 1, 1/
      DATA (NHEL(I,  30),I=1,6) / 1, 1, 0, 1, 1,-1/
      DATA (NHEL(I,  31),I=1,6) / 1, 1, 0, 1,-1, 1/
      DATA (NHEL(I,  32),I=1,6) / 1, 1, 0, 1,-1,-1/
      DATA IDEN/192/

      INTEGER POLARIZATIONS(0:NEXTERNAL,0:5)
      DATA ((POLARIZATIONS(I,J),I=0,NEXTERNAL),J=0,5)/NPOLENTRIES*-1/
      COMMON/BORN_BEAM_POL/POLARIZATIONS
C     
C     FUNCTIONS
C     
      LOGICAL IS_BORN_HEL_SELECTED

C     ----------
C     BEGIN CODE
C     ----------
      IF(USERHEL.EQ.-1) NTRY=NTRY+1
      DO IHEL=1,NEXTERNAL
        JC(IHEL) = +1
      ENDDO
C     When spin-2 particles are involved, the Helicity filtering is
C      dangerous for the 2->1 topology.
C     This is because depending on the MC setup the initial PS points
C      have back-to-back initial states
C     for which some of the spin-2 helicity configurations are zero.
C      But they are no longer zero
C     if the point is boosted on the z-axis. Remember that HELAS
C      helicity amplitudes are no longer
C     lorentz invariant with expternal spin-2 particles (only the
C      helicity sum is).
C     For this reason, we simply remove the filterin when there is
C      only three external particles.
      IF (NEXTERNAL.LE.3) THEN
        DO IHEL=1,NCOMB
          GOODHEL(IHEL)=.TRUE.
        ENDDO
      ENDIF
      ANS = 0D0
      DO IHEL=1,NCOMB
        IF (USERHEL.EQ.-1.OR.USERHEL.EQ.IHEL) THEN
          IF (GOODHEL(IHEL) .OR. NTRY .LT. 20.OR.USERHEL.NE.-1) THEN
            IF(NTRY.GE.2.AND.POLARIZATIONS(0,0).NE.
     $       -1.AND.(.NOT.IS_BORN_HEL_SELECTED(IHEL))) THEN
              CYCLE
            ENDIF
            T=MATRIX(P ,NHEL(1,IHEL),JC(1))
            IF(POLARIZATIONS(0,0).EQ.-1.OR.IS_BORN_HEL_SELECTED(IHEL))
     $        THEN
              ANS=ANS+T
            ENDIF
            IF (T .NE. 0D0 .AND. .NOT.    GOODHEL(IHEL)) THEN
              GOODHEL(IHEL)=.TRUE.
            ENDIF
          ENDIF
        ENDIF
      ENDDO
      ANS=ANS/DBLE(IDEN)
      IF(USERHEL.NE.-1) THEN
        ANS=ANS*HELAVGFACTOR
      ELSE
        DO J=1,NINITIAL
          IF (POLARIZATIONS(J,0).NE.-1) THEN
            ANS=ANS*BEAMS_HELAVGFACTOR(J)
            ANS=ANS/POLARIZATIONS(J,0)
          ENDIF
        ENDDO
      ENDIF
      END


      REAL*8 FUNCTION MATRIX(P,NHEL,IC)
C     
C     Generated by MadGraph5_aMC@NLO v. 2.5.2, 2016-12-10
C     By the MadGraph5_aMC@NLO Development Team
C     Visit launchpad.net/madgraph5 and amcatnlo.web.cern.ch
C     
C     Returns amplitude squared summed/avg over colors
C     for the point with external lines W(0:6,NEXTERNAL)
C     
C     Process: g b~ > x0 b b~ b~ QNP<=2 WEIGHTED<=5 @1
C     
      IMPLICIT NONE
C     
C     CONSTANTS
C     
      INTEGER    NGRAPHS
      PARAMETER (NGRAPHS=76)
      INTEGER    NEXTERNAL
      PARAMETER (NEXTERNAL=6)
      INTEGER    NWAVEFUNCS, NCOLOR
      PARAMETER (NWAVEFUNCS=19, NCOLOR=4)
      REAL*8     ZERO
      PARAMETER (ZERO=0D0)
      COMPLEX*16 IMAG1
      PARAMETER (IMAG1=(0D0,1D0))
C     
C     ARGUMENTS 
C     
      REAL*8 P(0:3,NEXTERNAL)
      INTEGER NHEL(NEXTERNAL), IC(NEXTERNAL)
C     
C     LOCAL VARIABLES 
C     
      INTEGER I,J
      COMPLEX*16 ZTEMP
      REAL*8 DENOM(NCOLOR), CF(NCOLOR,NCOLOR)
      COMPLEX*16 AMP(NGRAPHS), JAMP(NCOLOR)
      COMPLEX*16 W(20,NWAVEFUNCS)
      COMPLEX*16 DUM0,DUM1
      DATA DUM0, DUM1/(0D0, 0D0), (1D0, 0D0)/
C     
C     GLOBAL VARIABLES
C     
      INCLUDE 'coupl.inc'

C     
C     COLOR DATA
C     
      DATA DENOM(1)/1/
      DATA (CF(I,  1),I=  1,  4) /   12,    4,    4,    0/
C     1 T(1,2,5) T(4,6)
      DATA DENOM(2)/1/
      DATA (CF(I,  2),I=  1,  4) /    4,   12,    0,    4/
C     1 T(1,2,6) T(4,5)
      DATA DENOM(3)/1/
      DATA (CF(I,  3),I=  1,  4) /    4,    0,   12,    4/
C     1 T(1,4,5) T(2,6)
      DATA DENOM(4)/1/
      DATA (CF(I,  4),I=  1,  4) /    0,    4,    4,   12/
C     1 T(1,4,6) T(2,5)
C     ----------
C     BEGIN CODE
C     ----------
      CALL VXXXXX(P(0,1),ZERO,NHEL(1),-1*IC(1),W(1,1))
      CALL OXXXXX(P(0,2),MDL_MB,NHEL(2),-1*IC(2),W(1,2))
      CALL SXXXXX(P(0,3),+1*IC(3),W(1,3))
      CALL OXXXXX(P(0,4),MDL_MB,NHEL(4),+1*IC(4),W(1,4))
      CALL IXXXXX(P(0,5),MDL_MB,NHEL(5),-1*IC(5),W(1,5))
      CALL IXXXXX(P(0,6),MDL_MB,NHEL(6),-1*IC(6),W(1,6))
      CALL FFV1_2(W(1,5),W(1,1),GC_7,MDL_MB,ZERO,W(1,7))
      CALL FFS1_2_1(W(1,2),W(1,3),GC_102,GC_101,MDL_MB,ZERO,W(1,8))
      CALL FFV1P0_3(W(1,7),W(1,4),GC_7,ZERO,ZERO,W(1,9))
C     Amplitude(s) for diagram number 1
      CALL FFV1_0(W(1,6),W(1,8),W(1,9),GC_7,AMP(1))
      CALL FFV1P0_3(W(1,6),W(1,4),GC_7,ZERO,ZERO,W(1,10))
C     Amplitude(s) for diagram number 2
      CALL FFV1_0(W(1,7),W(1,8),W(1,10),GC_7,AMP(2))
      CALL FFS1_2_1(W(1,4),W(1,3),GC_102,GC_101,MDL_MB,ZERO,W(1,11))
      CALL FFV1P0_3(W(1,7),W(1,2),GC_7,ZERO,ZERO,W(1,12))
C     Amplitude(s) for diagram number 3
      CALL FFV1_0(W(1,6),W(1,11),W(1,12),GC_7,AMP(3))
      CALL FFV1P0_3(W(1,6),W(1,2),GC_7,ZERO,ZERO,W(1,13))
C     Amplitude(s) for diagram number 4
      CALL FFV1_0(W(1,7),W(1,11),W(1,13),GC_7,AMP(4))
      CALL FFS1_2_2(W(1,6),W(1,3),GC_102,GC_101,MDL_MB,ZERO,W(1,14))
C     Amplitude(s) for diagram number 5
      CALL FFV1_0(W(1,14),W(1,4),W(1,12),GC_7,AMP(5))
C     Amplitude(s) for diagram number 6
      CALL FFV1_0(W(1,14),W(1,2),W(1,9),GC_7,AMP(6))
      CALL FFS1_2_2(W(1,7),W(1,3),GC_102,GC_101,MDL_MB,ZERO,W(1,15))
C     Amplitude(s) for diagram number 7
      CALL FFV1_0(W(1,15),W(1,4),W(1,13),GC_7,AMP(7))
C     Amplitude(s) for diagram number 8
      CALL VVS2_6_0(W(1,13),W(1,9),W(1,3),GC_64,GC_10,AMP(8))
C     Amplitude(s) for diagram number 9
      CALL FFV1_0(W(1,15),W(1,2),W(1,10),GC_7,AMP(9))
C     Amplitude(s) for diagram number 10
      CALL VVS2_6_0(W(1,10),W(1,12),W(1,3),GC_64,GC_10,AMP(10))
      CALL VVS2_6P0_1(W(1,1),W(1,3),GC_64,GC_10,ZERO,ZERO,W(1,12))
      CALL FFV1P0_3(W(1,5),W(1,2),GC_7,ZERO,ZERO,W(1,15))
      CALL FFV1_1(W(1,4),W(1,12),GC_7,MDL_MB,ZERO,W(1,9))
C     Amplitude(s) for diagram number 11
      CALL FFV1_0(W(1,6),W(1,9),W(1,15),GC_7,AMP(11))
      CALL FFV1_2(W(1,6),W(1,12),GC_7,MDL_MB,ZERO,W(1,7))
C     Amplitude(s) for diagram number 12
      CALL FFV1_0(W(1,7),W(1,4),W(1,15),GC_7,AMP(12))
C     Amplitude(s) for diagram number 13
      CALL VVV8_0(W(1,12),W(1,15),W(1,10),GC_6,AMP(13))
      CALL FFV1P0_3(W(1,5),W(1,4),GC_7,ZERO,ZERO,W(1,16))
      CALL FFV1_1(W(1,2),W(1,12),GC_7,MDL_MB,ZERO,W(1,17))
C     Amplitude(s) for diagram number 14
      CALL FFV1_0(W(1,6),W(1,17),W(1,16),GC_7,AMP(14))
C     Amplitude(s) for diagram number 15
      CALL FFV1_0(W(1,7),W(1,2),W(1,16),GC_7,AMP(15))
C     Amplitude(s) for diagram number 16
      CALL VVV8_0(W(1,12),W(1,16),W(1,13),GC_6,AMP(16))
      CALL FFV1_2(W(1,5),W(1,12),GC_7,MDL_MB,ZERO,W(1,7))
C     Amplitude(s) for diagram number 17
      CALL FFV1_0(W(1,7),W(1,4),W(1,13),GC_7,AMP(17))
C     Amplitude(s) for diagram number 18
      CALL FFV1_0(W(1,5),W(1,9),W(1,13),GC_7,AMP(18))
C     Amplitude(s) for diagram number 19
      CALL FFV1_0(W(1,7),W(1,2),W(1,10),GC_7,AMP(19))
C     Amplitude(s) for diagram number 20
      CALL FFV1_0(W(1,5),W(1,17),W(1,10),GC_7,AMP(20))
      CALL FFV1_1(W(1,2),W(1,1),GC_7,MDL_MB,ZERO,W(1,17))
      CALL FFS1_2_2(W(1,5),W(1,3),GC_102,GC_101,MDL_MB,ZERO,W(1,7))
      CALL FFV1P0_3(W(1,6),W(1,17),GC_7,ZERO,ZERO,W(1,9))
C     Amplitude(s) for diagram number 21
      CALL FFV1_0(W(1,7),W(1,4),W(1,9),GC_7,AMP(21))
C     Amplitude(s) for diagram number 22
      CALL FFV1_0(W(1,7),W(1,17),W(1,10),GC_7,AMP(22))
      CALL FFS1_2_1(W(1,17),W(1,3),GC_102,GC_101,MDL_MB,ZERO,W(1,12))
C     Amplitude(s) for diagram number 23
      CALL FFV1_0(W(1,6),W(1,12),W(1,16),GC_7,AMP(23))
C     Amplitude(s) for diagram number 24
      CALL VVS2_6_0(W(1,16),W(1,9),W(1,3),GC_64,GC_10,AMP(24))
C     Amplitude(s) for diagram number 25
      CALL FFV1_0(W(1,14),W(1,17),W(1,16),GC_7,AMP(25))
      CALL FFV1P0_3(W(1,5),W(1,17),GC_7,ZERO,ZERO,W(1,18))
C     Amplitude(s) for diagram number 26
      CALL FFV1_0(W(1,6),W(1,11),W(1,18),GC_7,AMP(26))
C     Amplitude(s) for diagram number 27
      CALL FFV1_0(W(1,5),W(1,11),W(1,9),GC_7,AMP(27))
C     Amplitude(s) for diagram number 28
      CALL FFV1_0(W(1,14),W(1,4),W(1,18),GC_7,AMP(28))
C     Amplitude(s) for diagram number 29
      CALL VVS2_6_0(W(1,10),W(1,18),W(1,3),GC_64,GC_10,AMP(29))
C     Amplitude(s) for diagram number 30
      CALL FFV1_0(W(1,5),W(1,12),W(1,10),GC_7,AMP(30))
      CALL FFV1_1(W(1,4),W(1,1),GC_7,MDL_MB,ZERO,W(1,12))
      CALL FFV1P0_3(W(1,6),W(1,12),GC_7,ZERO,ZERO,W(1,18))
C     Amplitude(s) for diagram number 31
      CALL FFV1_0(W(1,7),W(1,2),W(1,18),GC_7,AMP(31))
C     Amplitude(s) for diagram number 32
      CALL FFV1_0(W(1,7),W(1,12),W(1,13),GC_7,AMP(32))
      CALL FFS1_2_1(W(1,12),W(1,3),GC_102,GC_101,MDL_MB,ZERO,W(1,9))
C     Amplitude(s) for diagram number 33
      CALL FFV1_0(W(1,6),W(1,9),W(1,15),GC_7,AMP(33))
C     Amplitude(s) for diagram number 34
      CALL VVS2_6_0(W(1,15),W(1,18),W(1,3),GC_64,GC_10,AMP(34))
C     Amplitude(s) for diagram number 35
      CALL FFV1_0(W(1,14),W(1,12),W(1,15),GC_7,AMP(35))
      CALL FFV1P0_3(W(1,5),W(1,12),GC_7,ZERO,ZERO,W(1,17))
C     Amplitude(s) for diagram number 36
      CALL FFV1_0(W(1,6),W(1,8),W(1,17),GC_7,AMP(36))
C     Amplitude(s) for diagram number 37
      CALL FFV1_0(W(1,5),W(1,8),W(1,18),GC_7,AMP(37))
C     Amplitude(s) for diagram number 38
      CALL FFV1_0(W(1,14),W(1,2),W(1,17),GC_7,AMP(38))
C     Amplitude(s) for diagram number 39
      CALL VVS2_6_0(W(1,13),W(1,17),W(1,3),GC_64,GC_10,AMP(39))
C     Amplitude(s) for diagram number 40
      CALL FFV1_0(W(1,5),W(1,9),W(1,13),GC_7,AMP(40))
      CALL FFV1_2(W(1,6),W(1,1),GC_7,MDL_MB,ZERO,W(1,9))
      CALL FFV1P0_3(W(1,9),W(1,2),GC_7,ZERO,ZERO,W(1,17))
C     Amplitude(s) for diagram number 41
      CALL FFV1_0(W(1,7),W(1,4),W(1,17),GC_7,AMP(41))
      CALL FFV1P0_3(W(1,9),W(1,4),GC_7,ZERO,ZERO,W(1,18))
C     Amplitude(s) for diagram number 42
      CALL FFV1_0(W(1,7),W(1,2),W(1,18),GC_7,AMP(42))
      CALL FFS1_2_2(W(1,9),W(1,3),GC_102,GC_101,MDL_MB,ZERO,W(1,12))
C     Amplitude(s) for diagram number 43
      CALL FFV1_0(W(1,12),W(1,4),W(1,15),GC_7,AMP(43))
C     Amplitude(s) for diagram number 44
      CALL VVS2_6_0(W(1,15),W(1,18),W(1,3),GC_64,GC_10,AMP(44))
C     Amplitude(s) for diagram number 45
      CALL FFV1_0(W(1,9),W(1,11),W(1,15),GC_7,AMP(45))
C     Amplitude(s) for diagram number 46
      CALL FFV1_0(W(1,12),W(1,2),W(1,16),GC_7,AMP(46))
C     Amplitude(s) for diagram number 47
      CALL VVS2_6_0(W(1,16),W(1,17),W(1,3),GC_64,GC_10,AMP(47))
C     Amplitude(s) for diagram number 48
      CALL FFV1_0(W(1,9),W(1,8),W(1,16),GC_7,AMP(48))
C     Amplitude(s) for diagram number 49
      CALL FFV1_0(W(1,5),W(1,8),W(1,18),GC_7,AMP(49))
C     Amplitude(s) for diagram number 50
      CALL FFV1_0(W(1,5),W(1,11),W(1,17),GC_7,AMP(50))
      CALL FFV1_2(W(1,7),W(1,1),GC_7,MDL_MB,ZERO,W(1,17))
C     Amplitude(s) for diagram number 51
      CALL FFV1_0(W(1,17),W(1,4),W(1,13),GC_7,AMP(51))
      CALL VVV8P0_1(W(1,1),W(1,13),GC_6,ZERO,ZERO,W(1,18))
C     Amplitude(s) for diagram number 52
      CALL FFV1_0(W(1,7),W(1,4),W(1,18),GC_7,AMP(52))
C     Amplitude(s) for diagram number 53
      CALL FFV1_0(W(1,17),W(1,2),W(1,10),GC_7,AMP(53))
      CALL VVV8P0_1(W(1,1),W(1,10),GC_6,ZERO,ZERO,W(1,17))
C     Amplitude(s) for diagram number 54
      CALL FFV1_0(W(1,7),W(1,2),W(1,17),GC_7,AMP(54))
      CALL VVV8P0_1(W(1,1),W(1,15),GC_6,ZERO,ZERO,W(1,7))
C     Amplitude(s) for diagram number 55
      CALL FFV1_0(W(1,6),W(1,11),W(1,7),GC_7,AMP(55))
      CALL FFV1_1(W(1,11),W(1,1),GC_7,MDL_MB,ZERO,W(1,9))
C     Amplitude(s) for diagram number 56
      CALL FFV1_0(W(1,6),W(1,9),W(1,15),GC_7,AMP(56))
C     Amplitude(s) for diagram number 57
      CALL FFV1_0(W(1,14),W(1,4),W(1,7),GC_7,AMP(57))
      CALL FFV1_2(W(1,14),W(1,1),GC_7,MDL_MB,ZERO,W(1,12))
C     Amplitude(s) for diagram number 58
      CALL FFV1_0(W(1,12),W(1,4),W(1,15),GC_7,AMP(58))
      CALL FFS1_2_3(W(1,5),W(1,2),GC_102,GC_101,MDL_MX0,MDL_WX0,W(1,19)
     $ )
C     Amplitude(s) for diagram number 59
      CALL VVSS1_3_0(W(1,1),W(1,10),W(1,19),W(1,3),GC_62,GC_13,AMP(59))
      CALL FFS1_2_3(W(1,6),W(1,4),GC_102,GC_101,MDL_MX0,MDL_WX0,W(1,19)
     $ )
C     Amplitude(s) for diagram number 60
      CALL VVSS1_3_0(W(1,1),W(1,15),W(1,3),W(1,19),GC_62,GC_13,AMP(60))
C     Amplitude(s) for diagram number 61
      CALL VVVS1_2_0(W(1,1),W(1,15),W(1,10),W(1,3),GC_65,GC_11,AMP(61))
C     Amplitude(s) for diagram number 62
      CALL VVS2_6_0(W(1,10),W(1,7),W(1,3),GC_64,GC_10,AMP(62))
C     Amplitude(s) for diagram number 63
      CALL VVS2_6_0(W(1,15),W(1,17),W(1,3),GC_64,GC_10,AMP(63))
      CALL VVV8P0_1(W(1,1),W(1,16),GC_6,ZERO,ZERO,W(1,15))
C     Amplitude(s) for diagram number 64
      CALL FFV1_0(W(1,6),W(1,8),W(1,15),GC_7,AMP(64))
      CALL FFV1_1(W(1,8),W(1,1),GC_7,MDL_MB,ZERO,W(1,7))
C     Amplitude(s) for diagram number 65
      CALL FFV1_0(W(1,6),W(1,7),W(1,16),GC_7,AMP(65))
C     Amplitude(s) for diagram number 66
      CALL FFV1_0(W(1,14),W(1,2),W(1,15),GC_7,AMP(66))
C     Amplitude(s) for diagram number 67
      CALL FFV1_0(W(1,12),W(1,2),W(1,16),GC_7,AMP(67))
      CALL FFS1_2_3(W(1,5),W(1,4),GC_102,GC_101,MDL_MX0,MDL_WX0,W(1,12)
     $ )
C     Amplitude(s) for diagram number 68
      CALL VVSS1_3_0(W(1,1),W(1,13),W(1,12),W(1,3),GC_62,GC_13,AMP(68))
      CALL FFS1_2_3(W(1,6),W(1,2),GC_102,GC_101,MDL_MX0,MDL_WX0,W(1,12)
     $ )
C     Amplitude(s) for diagram number 69
      CALL VVSS1_3_0(W(1,1),W(1,16),W(1,3),W(1,12),GC_62,GC_13,AMP(69))
C     Amplitude(s) for diagram number 70
      CALL VVVS1_2_0(W(1,1),W(1,16),W(1,13),W(1,3),GC_65,GC_11,AMP(70))
C     Amplitude(s) for diagram number 71
      CALL VVS2_6_0(W(1,13),W(1,15),W(1,3),GC_64,GC_10,AMP(71))
C     Amplitude(s) for diagram number 72
      CALL VVS2_6_0(W(1,16),W(1,18),W(1,3),GC_64,GC_10,AMP(72))
C     Amplitude(s) for diagram number 73
      CALL FFV1_0(W(1,5),W(1,7),W(1,10),GC_7,AMP(73))
C     Amplitude(s) for diagram number 74
      CALL FFV1_0(W(1,5),W(1,8),W(1,17),GC_7,AMP(74))
C     Amplitude(s) for diagram number 75
      CALL FFV1_0(W(1,5),W(1,9),W(1,13),GC_7,AMP(75))
C     Amplitude(s) for diagram number 76
      CALL FFV1_0(W(1,5),W(1,11),W(1,18),GC_7,AMP(76))
      JAMP(1)=+1D0/2D0*AMP(1)+1D0/6D0*AMP(2)+1D0/6D0*AMP(3)+1D0/2D0
     $ *AMP(4)+1D0/6D0*AMP(5)+1D0/2D0*AMP(6)+1D0/2D0*AMP(7)+1D0/2D0
     $ *AMP(8)+1D0/6D0*AMP(9)+1D0/6D0*AMP(10)+1D0/2D0*AMP(14)-1D0/2D0
     $ *IMAG1*AMP(16)+1D0/2D0*AMP(17)+1D0/6D0*AMP(19)+1D0/6D0*AMP(20)
     $ +1D0/2D0*AMP(21)+1D0/6D0*AMP(22)+1D0/2D0*AMP(23)+1D0/2D0*AMP(24)
     $ +1D0/2D0*AMP(25)+1D0/6D0*AMP(26)+1D0/2D0*AMP(27)+1D0/6D0*AMP(28)
     $ +1D0/6D0*AMP(29)+1D0/6D0*AMP(30)+1D0/2D0*AMP(51)+1D0/2D0*IMAG1
     $ *AMP(52)+1D0/6D0*AMP(53)-AMP(60)-1D0/2D0*IMAG1*AMP(64)+1D0/2D0
     $ *AMP(65)-1D0/2D0*IMAG1*AMP(66)-1D0/2D0*IMAG1*AMP(70)-1D0/2D0
     $ *IMAG1*AMP(71)+1D0/2D0*IMAG1*AMP(72)+1D0/6D0*AMP(73)+1D0/2D0
     $ *IMAG1*AMP(76)
      JAMP(2)=-1D0/2D0*AMP(12)-1D0/2D0*IMAG1*AMP(13)-1D0/6D0*AMP(14)
     $ -1D0/6D0*AMP(15)-1D0/2D0*AMP(20)-1D0/6D0*AMP(21)-1D0/2D0*AMP(22)
     $ -1D0/6D0*AMP(23)-1D0/6D0*AMP(24)-1D0/6D0*AMP(25)-1D0/2D0*AMP(26)
     $ -1D0/6D0*AMP(27)-1D0/2D0*AMP(28)-1D0/2D0*AMP(29)-1D0/2D0*AMP(30)
     $ -1D0/6D0*AMP(41)-1D0/2D0*AMP(42)-1D0/2D0*AMP(43)-1D0/2D0*AMP(44)
     $ -1D0/2D0*AMP(45)-1D0/6D0*AMP(46)-1D0/6D0*AMP(47)-1D0/6D0*AMP(48)
     $ -1D0/2D0*AMP(49)-1D0/6D0*AMP(50)+1D0/2D0*IMAG1*AMP(54)-1D0/2D0
     $ *IMAG1*AMP(55)-1D0/2D0*IMAG1*AMP(57)-1D0/2D0*AMP(58)-1D0/2D0
     $ *IMAG1*AMP(61)-1D0/2D0*IMAG1*AMP(62)+1D0/2D0*IMAG1*AMP(63)-1D0
     $ /6D0*AMP(65)-1D0/6D0*AMP(67)+AMP(68)-1D0/2D0*AMP(73)+1D0/2D0
     $ *IMAG1*AMP(74)
      JAMP(3)=-1D0/6D0*AMP(1)-1D0/2D0*AMP(2)-1D0/2D0*AMP(3)-1D0/6D0
     $ *AMP(4)-1D0/2D0*AMP(5)-1D0/6D0*AMP(6)-1D0/6D0*AMP(7)-1D0/6D0
     $ *AMP(8)-1D0/2D0*AMP(9)-1D0/2D0*AMP(10)-1D0/2D0*AMP(11)+1D0/2D0
     $ *IMAG1*AMP(13)-1D0/6D0*AMP(17)-1D0/6D0*AMP(18)-1D0/2D0*AMP(19)
     $ -1D0/2D0*AMP(31)-1D0/6D0*AMP(32)-1D0/2D0*AMP(33)-1D0/2D0*AMP(34)
     $ -1D0/2D0*AMP(35)-1D0/6D0*AMP(36)-1D0/2D0*AMP(37)-1D0/6D0*AMP(38)
     $ -1D0/6D0*AMP(39)-1D0/6D0*AMP(40)-1D0/6D0*AMP(51)-1D0/2D0*AMP(53)
     $ -1D0/2D0*IMAG1*AMP(54)+1D0/2D0*IMAG1*AMP(55)-1D0/2D0*AMP(56)
     $ +1D0/2D0*IMAG1*AMP(57)+1D0/2D0*IMAG1*AMP(61)+1D0/2D0*IMAG1
     $ *AMP(62)-1D0/2D0*IMAG1*AMP(63)+AMP(69)-1D0/2D0*IMAG1*AMP(74)
     $ -1D0/6D0*AMP(75)
      JAMP(4)=+1D0/6D0*AMP(11)+1D0/6D0*AMP(12)+1D0/2D0*AMP(15)+1D0/2D0
     $ *IMAG1*AMP(16)+1D0/2D0*AMP(18)+1D0/6D0*AMP(31)+1D0/2D0*AMP(32)
     $ +1D0/6D0*AMP(33)+1D0/6D0*AMP(34)+1D0/6D0*AMP(35)+1D0/2D0*AMP(36)
     $ +1D0/6D0*AMP(37)+1D0/2D0*AMP(38)+1D0/2D0*AMP(39)+1D0/2D0*AMP(40)
     $ +1D0/2D0*AMP(41)+1D0/6D0*AMP(42)+1D0/6D0*AMP(43)+1D0/6D0*AMP(44)
     $ +1D0/6D0*AMP(45)+1D0/2D0*AMP(46)+1D0/2D0*AMP(47)+1D0/2D0*AMP(48)
     $ +1D0/6D0*AMP(49)+1D0/2D0*AMP(50)-1D0/2D0*IMAG1*AMP(52)+1D0/6D0
     $ *AMP(56)+1D0/6D0*AMP(58)-AMP(59)+1D0/2D0*IMAG1*AMP(64)+1D0/2D0
     $ *IMAG1*AMP(66)+1D0/2D0*AMP(67)+1D0/2D0*IMAG1*AMP(70)+1D0/2D0
     $ *IMAG1*AMP(71)-1D0/2D0*IMAG1*AMP(72)+1D0/2D0*AMP(75)-1D0/2D0
     $ *IMAG1*AMP(76)

      MATRIX = 0.D0
      DO I = 1, NCOLOR
        ZTEMP = (0.D0,0.D0)
        DO J = 1, NCOLOR
          ZTEMP = ZTEMP + CF(J,I)*JAMP(J)
        ENDDO
        MATRIX = MATRIX+ZTEMP*DCONJG(JAMP(I))/DENOM(I)
      ENDDO

      END

      SUBROUTINE GET_ME(P, ALPHAS, NHEL ,ANS)
      IMPLICIT NONE
C     
C     CONSTANT
C     
      INTEGER    NEXTERNAL
      PARAMETER (NEXTERNAL=6)
C     
C     ARGUMENTS 
C     
      REAL*8 P(0:3,NEXTERNAL),ANS
      INTEGER NHEL
      DOUBLE PRECISION ALPHAS
      REAL*8 PI
CF2PY INTENT(OUT) :: ANS
CF2PY INTENT(IN) :: NHEL
CF2PY INTENT(IN) :: P(0:3,NEXTERNAL)
CF2PY INTENT(IN) :: ALPHAS
C     ROUTINE FOR F2PY to read the benchmark point.    
C     the include file with the values of the parameters and masses 
      INCLUDE 'coupl.inc'

      PI = 3.141592653589793D0
      G = 2* DSQRT(ALPHAS*PI)
      CALL UPDATE_AS_PARAM()
      IF (NHEL.NE.0) THEN
        CALL SMATRIXHEL(P, NHEL, ANS)
      ELSE
        CALL SMATRIX(P, ANS)
      ENDIF
      RETURN
      END

      SUBROUTINE INITIALISE(PATH)
C     ROUTINE FOR F2PY to read the benchmark point.    
      IMPLICIT NONE
      CHARACTER*180 PATH
CF2PY INTENT(IN) :: PATH
      CALL SETPARA(PATH)  !first call to setup the paramaters    
      RETURN
      END

      LOGICAL FUNCTION IS_BORN_HEL_SELECTED(HELID)
      IMPLICIT NONE
C     
C     CONSTANTS
C     
      INTEGER    NEXTERNAL
      PARAMETER (NEXTERNAL=6)
      INTEGER    NCOMB
      PARAMETER (NCOMB=32)
C     
C     ARGUMENTS
C     
      INTEGER HELID
C     
C     LOCALS
C     
      INTEGER I,J
      LOGICAL FOUNDIT
C     
C     GLOBALS
C     
      INTEGER HELC(NEXTERNAL,NCOMB)
      COMMON/BORN_HEL_CONFIGS/HELC

      INTEGER POLARIZATIONS(0:NEXTERNAL,0:5)
      COMMON/BORN_BEAM_POL/POLARIZATIONS
C     ----------
C     BEGIN CODE
C     ----------

      IS_BORN_HEL_SELECTED = .TRUE.
      IF (POLARIZATIONS(0,0).EQ.-1) THEN
        RETURN
      ENDIF

      DO I=1,NEXTERNAL
        IF (POLARIZATIONS(I,0).EQ.-1) THEN
          CYCLE
        ENDIF
        FOUNDIT = .FALSE.
        DO J=1,POLARIZATIONS(I,0)
          IF (HELC(I,HELID).EQ.POLARIZATIONS(I,J)) THEN
            FOUNDIT = .TRUE.
            EXIT
          ENDIF
        ENDDO
        IF(.NOT.FOUNDIT) THEN
          IS_BORN_HEL_SELECTED = .FALSE.
          RETURN
        ENDIF
      ENDDO

      RETURN
      END

