package openfl.filters;

import openfl.display.Shader;
import openfl.utils.ByteArray;

#if !openfl_debug
@:fileXml('tags="haxe,release"')
@:noDebug
#end
class BitmapFilterShader extends Shader
{
	@:glVertexHeader("in vec4 openfl_Position;
		in vec2 openfl_TextureCoord;

		out vec2 openfl_TextureCoordv;

		uniform mat4 openfl_Matrix;
		uniform vec2 openfl_TextureSize;")
	@:glVertexBody("openfl_TextureCoordv = openfl_TextureCoord;

		gl_Position = openfl_Matrix * openfl_Position;")
	@:glVertexSource("#pragma header

		void main(void) {

			#pragma body

		}")
	@:glFragmentHeader("layout(location = 0) out vec4 ofl_FragColor;
		out vec2 openfl_TextureCoordv;

		uniform sampler2D openfl_Texture;
		uniform vec2 openfl_TextureSize;")
	@:glFragmentBody("ofl_FragColor = texture (openfl_Texture, openfl_TextureCoordv);")
	#if emscripten
	@:glFragmentSource("#pragma header

		void main(void) {

			#pragma body

			ofl_FragColor = ofl_FragColor.bgra;

		}")
	#else
	@:glFragmentSource("#pragma header

		void main(void) {

			#pragma body

		}")
	#end
	public function new(code:ByteArray = null)
	{
		super(code);
	}
}
