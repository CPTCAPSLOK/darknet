REPOSITORY_LOCATIONS = dict(
    opencv = dict(
        sha256 = "e27fe5b168918ab60d58d7ace2bd82dd14a4d0bd1d3ae182952c2113f5637513",
        strip_prefix = "opencv-4.5.1",
        urls = ["https://github.com/opencv/opencv/archive/4.5.1.tar.gz"], # Check with: 'wget -O - <URL> | sha256sum'
    ),
    rules_foreign_cc = dict(
        sha256 = "e69d283a2605be6c70df53c9e39fc1bd5f9b2d559196378a5420427e7f08d064",
        strip_prefix = "rules_foreign_cc-ed95b95affecaa3ea3bf7bab3e0ab6aa847dfb06",
        # 2021-01-05
        urls = ["https://github.com/bazelbuild/rules_foreign_cc/archive/ed95b95affecaa3ea3bf7bab3e0ab6aa847dfb06.tar.gz"],
    )  
)
    