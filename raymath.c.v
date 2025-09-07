@[translated]
module vraylib

pub struct Float3 {
pub mut:
	v [3]f32
}

pub struct Float16 {
pub mut:
	v [16]f32
}

// empty enum
const fp_nan = 0
const fp_infinite = 1
const fp_zero = 2
const fp_subnormal = 3
const fp_normal = 4

@[c: 'Clamp']
pub fn clamp(value f32, min f32, max f32) f32

@[c: 'Lerp']
pub fn lerp(start f32, end f32, amount f32) f32

@[c: 'Normalize']
pub fn normalize(value f32, start f32, end f32) f32

@[c: 'Remap']
pub fn remap(value f32, inputstart f32, inputend f32, outputstart f32, outputend f32) f32

@[c: 'Wrap']
pub fn wrap(value f32, min f32, max f32) f32

@[c: 'FloatEquals']
pub fn float_equals(x f32, y f32) int

@[c: 'Vector2Zero']
pub fn vector2Zero() Vector2

@[c: 'Vector2One']
pub fn vector2One() Vector2

@[c: 'Vector2Add']
pub fn vector2Add(v1 Vector2, v2 Vector2) Vector2

@[c: 'Vector2AddValue']
pub fn vector2AddValue(v Vector2, add f32) Vector2

@[c: 'Vector2Subtract']
pub fn vector2Subtract(v1 Vector2, v2 Vector2) Vector2

@[c: 'Vector2SubtractValue']
pub fn vector2SubtractValue(v Vector2, sub f32) Vector2

@[c: 'Vector2Length']
pub fn vector2Length(v Vector2) f32

@[c: 'Vector2LengthSqr']
pub fn vector2LengthSqr(v Vector2) f32

@[c: 'Vector2DotProduct']
pub fn vector2DotProduct(v1 Vector2, v2 Vector2) f32

@[c: 'Vector2Distance']
pub fn vector2Distance(v1 Vector2, v2 Vector2) f32

@[c: 'Vector2DistanceSqr']
pub fn vector2DistanceSqr(v1 Vector2, v2 Vector2) f32

@[c: 'Vector2Angle']
pub fn vector2Angle(v1 Vector2, v2 Vector2) f32

@[c: 'Vector2Scale']
pub fn vector2Scale(v Vector2, scale f32) Vector2

@[c: 'Vector2Multiply']
pub fn vector2Multiply(v1 Vector2, v2 Vector2) Vector2

@[c: 'Vector2Negate']
pub fn vector2Negate(v Vector2) Vector2

@[c: 'Vector2Divide']
pub fn vector2Divide(v1 Vector2, v2 Vector2) Vector2

@[c: 'Vector2Normalize']
pub fn vector2Normalize(v Vector2) Vector2

@[c: 'Vector2Transform']
pub fn vector2Transform(v Vector2, mat Matrix) Vector2

@[c: 'Vector2Lerp']
pub fn vector2Lerp(v1 Vector2, v2 Vector2, amount f32) Vector2

@[c: 'Vector2Reflect']
pub fn vector2Reflect(v Vector2, normal Vector2) Vector2

@[c: 'Vector2Rotate']
pub fn vector2Rotate(v Vector2, angle f32) Vector2

@[c: 'Vector2MoveTowards']
pub fn vector2MoveTowards(v Vector2, target Vector2, maxdistance f32) Vector2

@[c: 'Vector2Invert']
pub fn vector2Invert(v Vector2) Vector2

@[c: 'Vector2Clamp']
pub fn vector2Clamp(v Vector2, min Vector2, max Vector2) Vector2

@[c: 'Vector2ClampValue']
pub fn vector2ClampValue(v Vector2, min f32, max f32) Vector2

@[c: 'Vector2Equals']
pub fn vector2Equals(p Vector2, q Vector2) int

@[c: 'Vector3Zero']
pub fn vector3Zero() Vector3

@[c: 'Vector3One']
pub fn vector3One() Vector3

@[c: 'Vector3Add']
pub fn vector3Add(v1 Vector3, v2 Vector3) Vector3

@[c: 'Vector3AddValue']
pub fn vector3AddValue(v Vector3, add f32) Vector3

@[c: 'Vector3Subtract']
pub fn vector3Subtract(v1 Vector3, v2 Vector3) Vector3

@[c: 'Vector3SubtractValue']
pub fn vector3SubtractValue(v Vector3, sub f32) Vector3

@[c: 'Vector3Scale']
pub fn vector3Scale(v Vector3, scalar f32) Vector3

@[c: 'Vector3Multiply']
pub fn vector3Multiply(v1 Vector3, v2 Vector3) Vector3

@[c: 'Vector3CrossProduct']
pub fn vector3CrossProduct(v1 Vector3, v2 Vector3) Vector3

@[c: 'Vector3Perpendicular']
pub fn vector3Perpendicular(v Vector3) Vector3

@[c: 'Vector3Length']
pub fn vector3Length(v Vector3) f32

@[c: 'Vector3LengthSqr']
pub fn vector3LengthSqr(v Vector3) f32

@[c: 'Vector3DotProduct']
pub fn vector3DotProduct(v1 Vector3, v2 Vector3) f32

@[c: 'Vector3Distance']
pub fn vector3Distance(v1 Vector3, v2 Vector3) f32

@[c: 'Vector3DistanceSqr']
pub fn vector3DistanceSqr(v1 Vector3, v2 Vector3) f32

@[c: 'Vector3Angle']
pub fn vector3Angle(v1 Vector3, v2 Vector3) f32

@[c: 'Vector3Negate']
pub fn vector3Negate(v Vector3) Vector3

@[c: 'Vector3Divide']
pub fn vector3Divide(v1 Vector3, v2 Vector3) Vector3

@[c: 'Vector3Normalize']
pub fn vector3Normalize(v Vector3) Vector3

@[c: 'Vector3OrthoNormalize']
pub fn vector3OrthoNormalize(v1 &Vector3, v2 &Vector3)

@[c: 'Vector3Transform']
pub fn vector3Transform(v Vector3, mat Matrix) Vector3

@[c: 'Vector3RotateByQuaternion']
pub fn vector3RotateByQuaternion(v Vector3, q Quaternion) Vector3

@[c: 'Vector3RotateByAxisAngle']
pub fn vector3RotateByAxisAngle(v Vector3, axis Vector3, angle f32) Vector3

@[c: 'Vector3Lerp']
pub fn vector3Lerp(v1 Vector3, v2 Vector3, amount f32) Vector3

@[c: 'Vector3Reflect']
pub fn vector3Reflect(v Vector3, normal Vector3) Vector3

@[c: 'Vector3Min']
pub fn vector3Min(v1 Vector3, v2 Vector3) Vector3

@[c: 'Vector3Max']
pub fn vector3Max(v1 Vector3, v2 Vector3) Vector3

@[c: 'Vector3Barycenter']
pub fn vector3Barycenter(p Vector3, a Vector3, b Vector3, c Vector3) Vector3

@[c: 'Vector3Unproject']
pub fn vector3Unproject(source Vector3, projection Matrix, view Matrix) Vector3

@[c: 'Vector3ToFloatV']
pub fn vector3ToFloatV(v Vector3) Float3

@[c: 'Vector3Invert']
pub fn vector3Invert(v Vector3) Vector3

@[c: 'Vector3Clamp']
pub fn vector3Clamp(v Vector3, min Vector3, max Vector3) Vector3

@[c: 'Vector3ClampValue']
pub fn vector3ClampValue(v Vector3, min f32, max f32) Vector3

@[c: 'Vector3Equals']
pub fn vector3Equals(p Vector3, q Vector3) int

@[c: 'Vector3Refract']
pub fn vector3Refract(v Vector3, n Vector3, r f32) Vector3

@[c: 'MatrixDeterminant']
pub fn matrix_determinant(mat Matrix) f32

@[c: 'MatrixTrace']
pub fn matrix_trace(mat Matrix) f32

@[c: 'MatrixTranspose']
pub fn matrix_transpose(mat Matrix) Matrix

@[c: 'MatrixInvert']
pub fn matrix_invert(mat Matrix) Matrix

@[c: 'MatrixIdentity']
pub fn matrix_identity() Matrix

@[c: 'MatrixAdd']
pub fn matrix_add(left Matrix, right Matrix) Matrix

@[c: 'MatrixSubtract']
pub fn matrix_subtract(left Matrix, right Matrix) Matrix

@[c: 'MatrixMultiply']
pub fn matrix_multiply(left Matrix, right Matrix) Matrix

@[c: 'MatrixTranslate']
pub fn matrix_translate(x f32, y f32, z f32) Matrix

@[c: 'MatrixRotate']
pub fn matrix_rotate(axis Vector3, angle f32) Matrix

@[c: 'MatrixRotateX']
pub fn matrix_rotate_x(angle f32) Matrix

@[c: 'MatrixRotateY']
pub fn matrix_rotate_y(angle f32) Matrix

@[c: 'MatrixRotateZ']
pub fn matrix_rotate_z(angle f32) Matrix

@[c: 'MatrixRotateXYZ']
pub fn matrix_rotate_xyz(angle Vector3) Matrix

@[c: 'MatrixRotateZYX']
pub fn matrix_rotate_zyx(angle Vector3) Matrix

@[c: 'MatrixScale']
pub fn matrix_scale(x f32, y f32, z f32) Matrix

@[c: 'MatrixFrustum']
pub fn matrix_frustum(left f64, right f64, bottom f64, top f64, near f64, far f64) Matrix

@[c: 'MatrixPerspective']
pub fn matrix_perspective(fovy f64, aspect f64, near f64, far f64) Matrix

@[c: 'MatrixOrtho']
pub fn matrix_ortho(left f64, right f64, bottom f64, top f64, near f64, far f64) Matrix

@[c: 'MatrixLookAt']
pub fn matrix_look_at(eye Vector3, target Vector3, up Vector3) Matrix

@[c: 'MatrixToFloatV']
pub fn matrix_to_float_v(mat Matrix) Float16

@[c: 'QuaternionAdd']
pub fn quaternion_add(q1 Quaternion, q2 Quaternion) Quaternion

@[c: 'QuaternionAddValue']
pub fn quaternion_add_value(q Quaternion, add f32) Quaternion

@[c: 'QuaternionSubtract']
pub fn quaternion_subtract(q1 Quaternion, q2 Quaternion) Quaternion

@[c: 'QuaternionSubtractValue']
pub fn quaternion_subtract_value(q Quaternion, sub f32) Quaternion

@[c: 'QuaternionIdentity']
pub fn quaternion_identity() Quaternion

@[c: 'QuaternionLength']
pub fn quaternion_length(q Quaternion) f32

@[c: 'QuaternionNormalize']
pub fn quaternion_normalize(q Quaternion) Quaternion

@[c: 'QuaternionInvert']
pub fn quaternion_invert(q Quaternion) Quaternion

@[c: 'QuaternionMultiply']
pub fn quaternion_multiply(q1 Quaternion, q2 Quaternion) Quaternion

@[c: 'QuaternionScale']
pub fn quaternion_scale(q Quaternion, mul f32) Quaternion

@[c: 'QuaternionDivide']
pub fn quaternion_divide(q1 Quaternion, q2 Quaternion) Quaternion

@[c: 'QuaternionLerp']
pub fn quaternion_lerp(q1 Quaternion, q2 Quaternion, amount f32) Quaternion

@[c: 'QuaternionNlerp']
pub fn quaternion_nlerp(q1 Quaternion, q2 Quaternion, amount f32) Quaternion

@[c: 'QuaternionSlerp']
pub fn quaternion_slerp(q1 Quaternion, q2 Quaternion, amount f32) Quaternion

@[c: 'QuaternionFromVector3ToVector3']
pub fn quaternion_from_vector3ToVector3(from Vector3, to Vector3) Quaternion

@[c: 'QuaternionFromMatrix']
pub fn quaternion_from_matrix(mat Matrix) Quaternion

@[c: 'QuaternionToMatrix']
pub fn quaternion_to_matrix(q Quaternion) Matrix

@[c: 'QuaternionFromAxisAngle']
pub fn quaternion_from_axis_angle(axis Vector3, angle f32) Quaternion

@[c: 'QuaternionToAxisAngle']
pub fn quaternion_to_axis_angle(q Quaternion, outaxis &Vector3, outangle &f32)

@[c: 'QuaternionFromEuler']
pub fn quaternion_from_euler(pitch f32, yaw f32, roll f32) Quaternion

@[c: 'QuaternionToEuler']
pub fn quaternion_to_euler(q Quaternion) Vector3

@[c: 'QuaternionTransform']
pub fn quaternion_transform(q Quaternion, mat Matrix) Quaternion

@[c: 'QuaternionEquals']
pub fn quaternion_equals(p Quaternion, q Quaternion) int
