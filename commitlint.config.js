module.exports = {
  extends: ["@commitlint/config-conventional"],
  parserPreset: {
    parserOpts: {
      headerPattern: /^[A-Z]{1,4}-[0-9]{1,4}\s(\w*)(?:\((.*)\))?: (.*)$/,
      headerCorrespondence: ["type", "scope", "subject"],
      issuePrefixes: ["^XXXX-[0-9]{1,4}"]
    }
  },
  rules: {
    "subject-case": [
      2,
      "always",
      [
        "camel-case",
        "kebab-case",
        "pascal-case",
        "sentence-case",
        "snake-case",
        "start-case",
      ]
    ]
  }
}
