C     This File is Automatically generated by ALOHA 
C     The process calculated in this file is: 
C     Metric(1,4)*Metric(2,3) - Metric(1,2)*Metric(3,4)
C     
      SUBROUTINE VVVVS2_0(V1, V2, V3, V4, S5, COUP,VERTEX)
      IMPLICIT NONE
      COMPLEX*16 CI
      PARAMETER (CI=(0D0,1D0))
      COMPLEX*16 V2(*)
      COMPLEX*16 V3(*)
      COMPLEX*16 TMP11
      COMPLEX*16 TMP6
      COMPLEX*16 V4(*)
      COMPLEX*16 TMP15
      COMPLEX*16 VERTEX
      COMPLEX*16 TMP1
      COMPLEX*16 COUP
      COMPLEX*16 S5(*)
      COMPLEX*16 V1(*)
      TMP15 = (V1(3)*V4(3)-V1(4)*V4(4)-V1(5)*V4(5)-V1(6)*V4(6))
      TMP11 = (V3(3)*V4(3)-V3(4)*V4(4)-V3(5)*V4(5)-V3(6)*V4(6))
      TMP6 = (V3(3)*V2(3)-V3(4)*V2(4)-V3(5)*V2(5)-V3(6)*V2(6))
      TMP1 = (V2(3)*V1(3)-V2(4)*V1(4)-V2(5)*V1(5)-V2(6)*V1(6))
      VERTEX = COUP*S5(3)*(-CI*(TMP6*TMP15)+CI*(TMP1*TMP11))
      END


