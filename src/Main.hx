package;

import kha.Color;
import kha.graphics2.Graphics;
import haxe.Utf8;
import kha.Assets;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;

class Main {
	static var myGlyphs:Array<Int> = [];
	static var helloWorldEnglish:String = "Hello world!";
	static var helloWorldGreek:String = "Γεια σου κόσμο!";
	static var helloWorldKorean:String = "안녕하세요!";

	public static function main() {
		System.start({title: "kha-ko", width: 800, height: 600}, function (_) {
			Assets.loadEverything(function () {
				addGlyphs(helloWorldEnglish);
				addGlyphs(helloWorldGreek);
				addGlyphs(helloWorldKorean);
				trace('glyphs:');
				trace(myGlyphs);
				Graphics.fontGlyphs = myGlyphs;

				System.notifyOnFrames(function (framebuffers) { render(framebuffers[0]); });
			});
		});
	}

	static function addGlyphs(line:String):Void {
		for(i in 0...Utf8.length(line)) {
			var glyph:Int = Utf8.charCodeAt(line, i);
			myGlyphs.push(glyph);
		}
	}

	static function render(framebuffer: Framebuffer): Void {
		var g:Graphics = framebuffer.g2;

		g.fontSize = 48;

		g.begin(true, Color.White);
		g.color = Color.Black;
		g.font = Assets.fonts.NotoSans_Regular;
		g.drawString(helloWorldEnglish, 16, 16);
		g.drawString(helloWorldGreek, 16, 64);
		g.font = Assets.fonts.HiMelody_Regular;
		g.drawString(helloWorldKorean, 16, 112);
		g.end();
	}
}
