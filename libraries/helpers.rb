def tarball_sha256sum(version)
  sha256sums = {
    '4.0.2' => '4cc36e5c6ca7c495667319df75feda1facb7c43a3d9686841f07a2522adec294', '4.1.0' => '597e1b1e381b9a9ed9f8a66e115ec4d7a0258fa36c81fe74f1e91b651fcd567a',
    '4.1.1' => '6f42d25f337fd49f38e2af81b9ab6e0c987a199a8c0b2e1410d072f812cb4520', '4.1.2' => '5f6213f7ac7ef71016a6750f09e7316ccc9bca139bc5389b417395b179bc370c'
  }
  sha256sum = sha256sums[version]
  fail "sha256sum is missing for kibana version #{version}" unless sha256sum
  sha256sum
end
