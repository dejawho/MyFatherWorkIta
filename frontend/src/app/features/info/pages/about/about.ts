import { ChangeDetectionStrategy, Component, inject } from '@angular/core';
import { RouterLink } from '@angular/router';
import { bugReportUrl, REPOSITORY } from '../../../../core/utils/bug-report';
import { VERSION } from '../../../../version';
import { I18n } from '../../../../core/services/i18n';
import { RichText } from '../../../storybook/components/rich-text/rich-text';

/** Version, author, licences and the attribution CC BY-NC asks for. */
@Component({
  selector: 'cr-about',
  changeDetection: ChangeDetectionStrategy.OnPush,
  imports: [RichText, RouterLink],
  templateUrl: './about.html',
  styleUrl: './about.css',
})
export class About {
  protected readonly tr = inject(I18n).tr;
  protected readonly version = VERSION;
  protected readonly repository = REPOSITORY;
  protected readonly bugReport = bugReportUrl({ where: 'About' });
}
