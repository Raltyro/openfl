package openfl.display._internal;

#if !flash
import openfl.display.BitmapData;
import openfl.display.Shader;

#if !openfl_debug
@:fileXml('tags="haxe,release"')
@:noDebug
#end
class Context3DAlphaMaskShader extends Shader
{
	public static var opaqueBitmapData:BitmapData = new BitmapData(1, 1, false, 0);

	@:glFragmentSource("layout(location = 0) out vec4 ofl_FragColor;
		out vec2 openfl_TextureCoordv;

		uniform sampler2D openfl_Texture;

		void main(void) {

			vec4 color = texture (openfl_Texture, openfl_TextureCoordv);

			if (color.a == 0.0) {

				discard;

			} else {

				ofl_FragColor = color;

			}

		}")
	@:glVertexSource("in vec4 openfl_Position;
		in vec2 openfl_TextureCoord;
		out vec2 openfl_TextureCoordv;

		uniform mat4 openfl_Matrix;

		void main(void) {

			openfl_TextureCoordv = openfl_TextureCoord;

			gl_Position = openfl_Matrix * openfl_Position;

		}")
	public function new()
	{
		super();
	}
}
#end
