#include <ph/PhantasyEngineMain.hpp>
#include <ph/game_loop/GameLoopUpdateable.hpp>

#include <sfz/memory/SmartPointers.hpp>

#include "TestbedUpdateable.hpp"

static ph::InitOptions createInitOptions()
{
	ph::InitOptions options;

	options.appName = "PhantasyTestbed";

#ifdef __EMSCRIPTEN__
	options.iniLocation = ph::IniLocation::NEXT_TO_EXECUTABLE;
#else
	options.iniLocation = ph::IniLocation::MY_GAMES_DIR;
#endif

	options.createInitialUpdateable = []() -> sfz::UniquePtr<ph::GameLoopUpdateable> {
		return sfz::makeUniqueDefault<TestbedUpdateable>();
	};

#ifdef __EMSCRIPTEN__
	options.rendererName = "Renderer-WebGL";
#else
	options.rendererName = "Renderer-ModernGL";
#endif

	return options;
}

PHANTASY_ENGINE_MAIN(createInitOptions);