# Add License to Project

## Run script




# Open Source License Guide

## License Comparison Matrix

| License | Copyleft | Commercial Use | Patent Protection | Attribution Required | Source Disclosure | Permissiveness Level |
|---------|----------|----------------|-------------------|---------------------|-------------------|----------------------|
| **AGPL-3.0** | Strong | ✅ | ✅ | ✅ | Required (including SaaS) | Least Permissive |
| **GPL-3.0** | Strong | ✅ | ✅ | ✅ | Required (distribution only) | Very Restrictive |
| **GPL-2.0** | Strong | ✅ | ❌ | ✅ | Required (distribution only) | Very Restrictive |
| **LGPL-3.0** | Weak | ✅ | ✅ | ✅ | Required (for library changes) | Moderately Restrictive |
| **MPL-2.0** | File-level | ✅ | ✅ | ✅ | Required (for modified files) | Moderate |
| **CDDL-1.0** | File-level | ✅ | ✅ | ✅ | Required (for modified files) | Moderate |
| **EPL-2.0** | Weak | ✅ | ✅ | ✅ | Required (for modifications) | Moderate |
| **Apache-2.0** | None | ✅ | ✅ | ✅ | Optional | Permissive |
| **MIT** | None | ✅ | ❌ | ✅ | Optional | Very Permissive |
| **BSD-3-Clause** | None | ✅ | ❌ | ✅ | Optional | Very Permissive |
| **BSD-2-Clause** | None | ✅ | ❌ | ✅ | Optional | Very Permissive |
| **0BSD** | None | ✅ | ❌ | ❌ | Optional | Most Permissive |
| **Unlicense** | None | ✅ | ❌ | ❌ | Optional | Public Domain |

## License Categories

### 🔒 Strong Copyleft (Viral)
- **GPL-2.0/3.0, AGPL-3.0**: Entire derivative works must be open source
- **Use when**: You want to ensure all improvements remain open source

### 🔓 Weak Copyleft (Hybrid)
- **LGPL, MPL-2.0, EPL**: Only modifications to original code must be shared
- **Use when**: You want library adoption while protecting core improvements

### ✅ Permissive (Business-Friendly)
- **Apache-2.0, MIT, BSD**: Can be incorporated into proprietary software
- **Use when**: You want maximum adoption and don't care about derivatives

## How to Choose Your License

### 1. **What's your primary goal?**

**Maximum Adoption & Industry Use**
→ Choose: MIT, Apache-2.0, or BSD-3-Clause

**Ensure Improvements Stay Open**
→ Choose: GPL-3.0 or AGPL-3.0

**Balance Between Both**
→ Choose: MPL-2.0 or LGPL-3.0

### 2. **Consider your project type:**

**Library/Framework**
- Permissive (MIT/Apache) = More adoption
- LGPL = Protects library while allowing proprietary apps

**Application/Tool**
- GPL = Ensures forks remain open
- MIT/Apache = Allows proprietary forks

**Web Service/SaaS**
- AGPL = Prevents proprietary SaaS forks
- MIT/Apache = Allows commercial SaaS use

### 3. **Do you need patent protection?**

**Yes** → Apache-2.0, GPL-3.0, MPL-2.0
**No** → MIT, BSD variants

### 4. **Common Use Cases:**

| Scenario | Recommended License | Why |
|----------|-------------------|-----|
| Take-home coding assignment | Apache-2.0 + commercial exception | Professional, allows evaluation, reserves commercial rights |
| Personal project for portfolio | MIT | Simple, widely understood, maximum compatibility |
| Community-driven tool | GPL-3.0 | Ensures community improvements stay open |
| JavaScript library | MIT | De facto standard, maximum adoption |
| Enterprise software | Apache-2.0 | Patent protection, enterprise-friendly |
| Academic research code | BSD-3-Clause | Academic tradition, simple attribution |
| Anti-corporate project | AGPL-3.0 | Prevents proprietary commercialization |

## Quick Decision Tree

```
Do you want derivatives to remain open source?
├── Yes → Do you want to prevent proprietary SaaS use?
│   ├── Yes → AGPL-3.0
│   └── No → GPL-3.0
└── No → Do you need patent protection?
    ├── Yes → Apache-2.0
    └── No → Do you want maximum simplicity?
        ├── Yes → MIT
        └── No → BSD-3-Clause
```

## Pro Tips

- **Can't decide?** MIT and Apache-2.0 are safe defaults for most projects
- **Want flexibility?** You can always make future versions more restrictive (but not less)
- **Multiple licenses?** You can dual-license (offer choice) or use different licenses for different components
- **Changing licenses?** Requires permission from all contributors or a CLA

## Resources

- [Choose a License](https://choosealicense.com/) - GitHub's license picker
- [SPDX License List](https://spdx.org/licenses/) - Official license database
- [OSI Approved Licenses](https://opensource.org/licenses/) - Open Source Initiative approved licenses
