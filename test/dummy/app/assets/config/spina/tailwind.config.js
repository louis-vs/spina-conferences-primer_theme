module.exports = {
  content: [
    '/home/louis/.local/share/gem/gems/spina-2.8.0/app/views/**/*.*',
'/home/louis/.local/share/gem/gems/spina-2.8.0/app/components/**/*.*',
'/home/louis/.local/share/gem/gems/spina-2.8.0/app/helpers/**/*.*',
'/home/louis/.local/share/gem/gems/spina-2.8.0/app/assets/javascripts/**/*.js',
'/home/louis/.local/share/gem/gems/spina-2.8.0/app/**/application.tailwind.css',
'/home/louis/.local/share/gem/gems/spina-admin-conferences-blog-0.2.0/app/views/spina/admin/hooks/conferences/blog/_primary_navigation.html.erb',
'/home/louis/.local/share/gem/gems/spina-admin-conferences-blog-0.2.0/app/views/spina/admin/conferences/blog/posts/new.html.erb',
'/home/louis/.local/share/gem/gems/spina-admin-conferences-blog-0.2.0/app/views/spina/admin/conferences/blog/posts/_form_post_seo.html.erb',
'/home/louis/.local/share/gem/gems/spina-admin-conferences-blog-0.2.0/app/views/spina/admin/conferences/blog/posts/_form_post_content.html.erb',
'/home/louis/.local/share/gem/gems/spina-admin-conferences-blog-0.2.0/app/views/spina/admin/conferences/blog/posts/index.html.erb',
'/home/louis/.local/share/gem/gems/spina-admin-conferences-blog-0.2.0/app/views/spina/admin/conferences/blog/posts/_form.html.erb',
'/home/louis/.local/share/gem/gems/spina-admin-conferences-blog-0.2.0/app/views/spina/admin/conferences/blog/posts/edit.html.erb',
'/home/louis/.local/share/gem/gems/spina-admin-conferences-blog-0.2.0/app/views/spina/admin/conferences/blog/posts/_post.html.erb',
'/home/louis/.local/share/gem/gems/spina-admin-conferences-blog-0.2.0/app/views/spina/admin/conferences/blog/posts/_form_post_configuration.html.erb',
'/home/louis/.local/share/gem/gems/spina-admin-conferences-blog-0.2.0/app/views/spina/admin/conferences/blog/categories/new.html.erb',
'/home/louis/.local/share/gem/gems/spina-admin-conferences-blog-0.2.0/app/views/spina/admin/conferences/blog/categories/_category.html.erb',
'/home/louis/.local/share/gem/gems/spina-admin-conferences-blog-0.2.0/app/views/spina/admin/conferences/blog/categories/index.html.erb',
'/home/louis/.local/share/gem/gems/spina-admin-conferences-blog-0.2.0/app/views/spina/admin/conferences/blog/categories/_form.html.erb',
'/home/louis/.local/share/gem/gems/spina-admin-conferences-blog-0.2.0/app/views/spina/admin/conferences/blog/categories/edit.html.erb',
'/home/louis/.local/share/gem/gems/spina-admin-conferences-blog-0.2.0/app/views/layouts/default/application.html.erb',
'/home/louis/.local/share/gem/gems/spina-admin-conferences-fork-3.0.0.rc1/app/views/**/*.*',
'/home/louis/.local/share/gem/gems/spina-admin-conferences-fork-3.0.0.rc1/app/components/**/*.*',
'/home/louis/.local/share/gem/gems/spina-admin-conferences-fork-3.0.0.rc1/app/helpers/**/*.*',
'/home/louis/.local/share/gem/gems/spina-admin-conferences-fork-3.0.0.rc1/app/assets/javascripts/**/*.js',
'/home/louis/.local/share/gem/gems/spina-admin-conferences-fork-3.0.0.rc1/app/**/application.tailwind.css',
'/home/louis/.local/share/gem/gems/spina-admin-journal-1.0.0.rc1/app/views/**/*.*',
'/home/louis/.local/share/gem/gems/spina-admin-journal-1.0.0.rc1/app/components/**/*.*',
'/home/louis/.local/share/gem/gems/spina-admin-journal-1.0.0.rc1/app/helpers/**/*.*',
'/home/louis/.local/share/gem/gems/spina-admin-journal-1.0.0.rc1/app/assets/javascripts/**/*.js'
  ],  
  theme: {
    fontFamily: {
      body: ['Metropolis'],
      mono: ['ui-monospace', 'SFMono-Regular', 'Menlo', 'Monaco', 'Consolas', "Liberation Mono", "Courier New", 'monospace']
    },
    extend: {
      colors: {
        spina: {
          light: '#797ab8',
          DEFAULT: '#6865b4',
          dark: '#3a3a70'
        }
      }
    }
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
