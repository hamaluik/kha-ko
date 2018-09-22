let project = new Project('kha-ko');

project.addAssets("assets");

project.addDefine('debug');

project.addSources("src");

resolve(project);