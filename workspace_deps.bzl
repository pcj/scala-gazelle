load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def _maybe(repo_rule, name, **kwargs):
    if name not in native.existing_rules():
        repo_rule(name = name, **kwargs)

def workspace_deps():
    io_bazel_rules_go()  # via bazel_gazelle
    bazel_gazelle()  # via <TOP>
    rules_proto()  # via <TOP>
    rules_antlr()
    build_stack_rules_proto()

def io_bazel_rules_go():
    _maybe(
        http_archive,
        name = "io_bazel_rules_go",
        sha256 = "38171ce619b2695fa095427815d52c2a115c716b15f4cd0525a88c376113f584",
        strip_prefix = "rules_go-0.28.0",
        urls = [
            "https://github.com/bazelbuild/rules_go/archive/v0.28.0.tar.gz",
        ],
    )

def bazel_gazelle():
    _maybe(
        http_archive,
        name = "bazel_gazelle",
        sha256 = "cb05501bd37e2cbfdea8e23b28e5a7fe4ff4f12cef30eeb1924a0b8c3c0cea61",
        strip_prefix = "bazel-gazelle-425d85daecb9aeffa1ae24b83df7b97b534dcf05",
        urls = [
            "https://github.com/bazelbuild/bazel-gazelle/archive/425d85daecb9aeffa1ae24b83df7b97b534dcf05.tar.gz",
        ],
    )

def rules_proto():
    _maybe(
        http_archive,
        name = "rules_proto",
        sha256 = "9fc210a34f0f9e7cc31598d109b5d069ef44911a82f507d5a88716db171615a8",
        strip_prefix = "rules_proto-f7a30f6f80006b591fa7c437fe5a951eb10bcbcf",
        urls = [
            "https://github.com/bazelbuild/rules_proto/archive/f7a30f6f80006b591fa7c437fe5a951eb10bcbcf.tar.gz",
        ],
    )

def rules_antlr():
    # Branch: master
    # Commit: 89a29cca479363a5aee53e203719510bdc6be6ff
    # Date: 2020-01-21 21:48:34 +0000 UTC
    # URL: https://github.com/marcohu/rules_antlr/commit/89a29cca479363a5aee53e203719510bdc6be6ff
    #
    # Remove theme
    # Size: 114408 (114 kB)
    _maybe(
        http_archive,
        name = "rules_antlr",
        sha256 = "0df8550be207576a649bedbb21c619fb3a20025916f2df6ffd801ad7f7f7d48b",
        strip_prefix = "rules_antlr-89a29cca479363a5aee53e203719510bdc6be6ff",
        urls = ["https://github.com/marcohu/rules_antlr/archive/89a29cca479363a5aee53e203719510bdc6be6ff.tar.gz"],
    )

def build_stack_rules_proto():
    native.local_repository(
        name = "build_stack_rules_proto",
        path = "/Users/i868039/go/src/github.com/stackb/rules_proto",
    )
