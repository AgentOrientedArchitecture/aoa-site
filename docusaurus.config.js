// @ts-check
const config = {
  title: 'Agent Oriented Architecture',
  tagline: 'Principles, Reference Implementations, and Daily Discussion',
  url: 'https://agentorientedarchitecture.dev',
  baseUrl: '/',
  favicon: 'img/favicon.ico',
  organizationName: 'AgentOrientedArchitecture',
  projectName: 'aoa-site',
  deploymentBranch: 'gh-pages',
  trailingSlash: false,
  presets: [
    [
      'classic',
      {
        docs: {
          sidebarPath: require.resolve('./sidebars.js')
        },
        blog: {
          showReadingTime: true
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css')
        }
      }
    ]
  ],
  themes: ['@docusaurus/theme-mermaid'],
  markdown: { mermaid: true },
  themeConfig: {
    navbar: {
      title: 'AOA',
      items: [
        {to: '/docs/intro', label: 'Docs', position: 'left'},
        {to: '/blog', label: 'Blog', position: 'left'},
        {
          href: 'https://github.com/AgentOrientedArchitecture/aoa-labs',
          label: 'GitHub',
          position: 'right'
        }
      ]
    },
    footer: {
      style: 'dark',
      copyright: `© ${new Date().getFullYear()} Agent Oriented Architecture`
    }
  }
};
module.exports = config;
